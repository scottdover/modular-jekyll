require "modular/jekyll/version"

module Modular
  module Jekyll < Jekyll::Generator
    def create_modular_content(page, modules, modules_dir)
        content = ''

        modules.each do | mod |
            module_html = '';
            params = Hash.new

            if mod.is_a? String
                # If we've a string, just load the file
                module_html = File.read File.join Dir.pwd, modules_dir, "#{mod}.html"
            else
                # Otherwise, we have params. Load the file and inject the params
                mod.select do |modName, modParams|
                    module_html = File.read File.join Dir.pwd, modules_dir, "#{modName}.html"
                    params['include'] = modParams
                end
            end

            # Pass page into our partial
            params['page'] = page
            tmpl = Liquid::Template.parse(module_html).render(params)

            # Append it to the content
            content += tmpl
        end

        content
    end

    def generate(site)
        modules_dir = site.config['modules']
        modules_dir = '_includes/modules' if not modules_dir else modules_dir

        site.pages.map do | page |
            if (page.data['modules'])
                page.data['moduleContent'] = create_modular_content(
                    page,
                    page.data['modules'],
                    modules_dir
                )
            end
            page
        end
    end
  end
end
