class Carrinho < SitePrism::Page

    set_url 'https://www.groupon.com.br/sao-paulo-so/global-eletro/kit-10-batons-queen-fosco-matt'
    element :campo_pessoas, 'input[name="q"]'
    element :campo_dia, 'input[class="ellipsis short-title"]'
    element :botao_compre, '#compre'
    element :qtd_cupom, 'input[name="qtd-plus"]'
 
 
     def deve_adicionar_item_carrinho
       botao_compre.click
    end 

     def deve_aumentar_qtd_produto
        find('.qtd-plus', :text => "+").click
    end

    def deve_remover_item_carrinho
        find(:css, 'a[title="Remover"]').click
        find(:css, 'a[class="modalConfirmRemoveCart-remove"]').click
    end
end
