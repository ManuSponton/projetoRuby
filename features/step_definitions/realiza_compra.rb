Dado("que eu faco login") do
  @home = HomePage.new
  @home.load
  @home.deve_realizar_login
end

Quando("eu pesquiso um produto") do |table|
  @pesquisa_produto = table.rows_hash['produto']
  @ConsultaPage = ConsultaPage.new
  @ConsultaPage.deve_pesquisar_produto('batom')
end

Quando("seleciono o produto") do
  find(:css, 'a[data-id="5ac24b14e4b04202893ea109"]').click
end

Quando("eu clico em Compre") do
  @compra = Carrinho.new
  @compra.load
  @compra.deve_adicionar_item_carrinho
end

Quando("eu inserir mais um produto na minha compra") do
  @compra.deve_aumentar_qtd_produto
end

Quando("eu possuo um produto no meu carrinho") do |table|
  @pesquisa_produto = table.rows_hash['produto']
  @ConsultaPage = ConsultaPage.new
  @ConsultaPage.deve_pesquisar_produto('batom')

  @compra = Carrinho.new
  @compra.load
  @compra.deve_adicionar_item_carrinho
end

Quando("seleciono a opcao de pagamento Cartao de Credito") do
  find("input[value='VISA']").click
end

Quando("eu removo o item do carrinho") do
  @remover_item_carrinho = Carrinho.new
  @remover_item_carrinho.deve_remover_item_carrinho
end

Quando("preencho os campos numero de cartao e CPF com valores invalidos") do
  @tentativa_forma_pgto = Pagamento.new
  @tentativa_forma_pgto.tentativa_forma_pagamento
end

Entao("eu serei direcionado para a pagina de compra") do
  expect(page).to have_current_path('https://www.groupon.com.br/sao-paulo-so/global-eletro/kit-10-batons-queen-fosco-matt', url: true)
end

Entao("eu serei redirecionado para a pagina de forma de pagamento") do
  expect(page).to have_current_path('https://carrinho.groupon.com.br/v2/comprando', url: true)
end

Entao("eu deverei possuir dois produtos no meu carrinho") do
  qtd = find('input[name="qtd-cupom"]').value
  expect(qtd).to eql '2'
end

Entao("eu devo conseguir preencher os dados do cartao de credito") do
  @forma_pgto = Pagamento.new
  @forma_pgto.load
  @forma_pgto.selecionar_forma_pgto_credito
end

Entao("eu devo ver a seguinte mensagem {string}") do |mensagem|
  expect(page).to have_content mensagem
end 

Entao("eu devo visualizar a mensagem {string}") do |alerta|
  expect(page).to have_content alerta
end