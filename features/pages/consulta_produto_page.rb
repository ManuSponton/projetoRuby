class ConsultaPage < SitePrism::Page

    element :pesquisa_produto, 'input[name="q"]'
    element :seleciona_produto, 'input[class="ellipsis short-title"]'
    element :botao_pesquisa, 'input[class="search-box"]'
 
 
     def deve_pesquisar_produto(produto)
        pesquisa_produto.set produto
        find(:css, 'input[name="q"]').native.send_keys(:return)
     end
 end 