class HomePage < SitePrism::Page

   set_url '/'
   element :campo_email, '#email'
   element :campo_senha, '#password'
   element :botao_logar, '#btn-login'


    def deve_realizar_login
        campo_email.set 'usuarioteste775333@gmail.com'
        campo_senha.set '@XFGS117882!'
        botao_logar.click
    end
end 