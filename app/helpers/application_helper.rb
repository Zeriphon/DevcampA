module ApplicationHelper
    def login_helper
        if current_user
            link_to "Logout", destroy_user_session_path, method: :delete
        else
            (link_to "Register", new_user_registration_path) +
            "<br>".html_safe +
            (link_to "Login", new_user_session_path)
        end
    end
    
    def source_helper
        if session[:source]
            greeting = "Thanks for visiting me from #{session[:source]}"
            content_tag(:p, greeting, class: "source-greeting")
        end
    end
    
    def copyright_generator
        AciViewTool::Renderer.copyright 'Aciojn Quazson', 'All rights yet to be reserved.'
    end
end
