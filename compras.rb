require 'json'
require './colors'

@lista = []

def limpar_terminal
  if system('cls').nil?
    system('clear')
  else
    system('cls')
  end
end

def cadastrar_produtos
  loop do
    begin
      limpar_terminal
      print 'Digite o nome do produto: '
      produto = gets.chomp.capitalize
      raise 'Por favor, digite algo'.red if produto.empty? || produto == ' '

      @lista.each do |item|
        raise 'Este produto já existe'.red if item[:nome] == produto
      end
    rescue StandardError => e
      limpar_terminal
      print e
      sleep(0.5)
      retry
    end

    print 'Digite o valor do produto: '
    preco = gets.chomp.to_f
    preco = 'Free!' if preco.zero?

    print 'Digite a marca do produto: '
    marca = gets.chomp
    marca = 'Nenhuma' if marca.empty? || marca == ' '

    @lista << { nome: produto, preco: preco, marca: marca }
    puts 'Produto adicionado com sucesso!!'.green
    sleep(0.5)

    print "Caso Queira parar digite 'FIM':  "
    fim = gets.chomp.downcase
    fim == 'fim' ? break : nil
  end
end

def deletar_produto
  mostrar_produtos
  print 'Qual item deseja excluir: '
  nome = gets.chomp.capitalize
  @lista.each do |produto|
    next unless nome == produto[:nome]

    index = @lista.index(produto)
    @lista.delete_at(index)
    puts 'Produto deletado com sucesso'.green
    sleep 0.3
    limpar_terminal
  end
end

def editar_produto
  mostrar_produtos
  print 'Digite o nome do produto: '
  nome = gets.chomp.capitalize
  nome = @lista.select { |produto| produto[:nome] == nome }
  begin
    raise 'Este produto não existe, deseja adiciona-lo? (S/n): '.red if nome.empty?

    @lista.each do |produto|
      next unless produto == nome[0]

      print 'Digite o novo nome: '
      novo_nome = gets.chomp
      produto[:nome] = novo_nome.empty? ? produto[:nome] : novo_nome.capitalize

      print 'Digite o novo preço: '
      novo_preco = gets.chomp
      produto[:preco] = novo_preco.empty? ? produto[:preco] : novo_preco.to_f

      print 'Digite a nova marca: '
      nova_marca = gets.chomp
      produto[:marca] = nova_marca.empty? ? produto[:marca] : nova_marca
    end
  rescue StandardError => e
    print e
    decisao = gets.chomp
    cadastrar_produtos if decisao == 'Sim'.downcase || decisao == 's'.downcase
  end
end

def mostrar_produtos
  limpar_terminal
  @lista.each do |produto|
    puts "Nome: #{produto[:nome]}".bold,
         "Preço: #{produto[:preco]}".bold,
         "Marca: #{produto[:marca]}".bold
    puts '-'.white * 20
  end
  sleep 1
end

def imprimir_produtos
  print 'Qual nome deseja dar ao arquivo: '
  nome = gets.chomp
  File.open("#{nome}.json", 'w') do |p|
    p << @lista.to_json
  end
	puts 'Lista salva com sucesso!'.green
	sleep 0.9
end

loop do
  puts '1 - Cadastrar produto'.green, '2 - Deletar produto'.red, '3 - Editar produto'.yellow,
       '4 - Ver Todos os produtos'.blue, '5 - Imprimir Produtos'.magenta, '0 - Sair do programa'.bold
  print 'Escolha um opção: '
  escolha = gets.chomp.to_i
  case escolha
  when 0
    'Até mais...'.split('').each do |letra|
      print letra.yellow
      sleep 0.2
    end
    break
  when 1
    cadastrar_produtos
  when 2
    deletar_produto
  when 3
    editar_produto
  when 4
    mostrar_produtos
  when 5
    imprimir_produtos
  else
    puts 'Digite um comando válido'.red
  end
end
