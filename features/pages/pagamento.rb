class Pagamento < SitePrism::Page

    set_url 'https://carrinho.groupon.com.br/v2/comprando'
    element :bandeira_cartao, '#VISA'
    element :num_cartao, '#numero-cartao'
    element :nome_escr_cartao, '#nome-cartao'
    element :tel_titular, '#telefone-cartao'
    element :cod_seguranca, '#cvv-novo-cartao'
    element :cpf_titular, '#cpf-cartao'
 
 
     def selecionar_forma_pgto_credito
            num_cartao.set '4485507267517092'
            nome_escr_cartao.set 'Manu Sponton'
            tel_titular.set '19324524242'
            #usei xpath aqui, porque retornaram 9 elementos na consulta por installments-select
            find(:xpath, "//*[@id=\"billing_address_new_cc\"]/div[2]/div[1]/div/select/option[1]").click
            select('01 - Janeiro', from:'mes-cartao')
            select('2018', from:'ano-cartao')
            cod_seguranca.set '359'
            cpf_titular.set '78575543083'
    end 

    def tentativa_forma_pagamento
        num_cartao.set '448550726751709'
        cpf_titular.set '11111111111'
        nome_escr_cartao.click
    end
end
