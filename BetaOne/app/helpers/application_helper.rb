module ApplicationHelper
    def self.nav_item user_id
        user = User.find(user_id)
      
        arr = Array.new
        nav_itemx = arr.push({id: "home", href: "/users/<%= session[:user_id]%>", value: "Home"})
        nav_itemx = arr.push({id: "clients", href: "/clients/new", value: "Cadastrar Cliente"})
        nav_itemx = arr.push({id: "users", href: "/users/new", value: "Cadastrar Usuario"})
        nav_itemx = arr.push({id: "clients/list", href: "/clients/list", value: "Buscar Cliente"})
    
        nav_itemx
    end
end
