# treinasom.m
#
# Licenca
# =======
#
# Copyright (c) 2016 Eduardo Santos Medeiros de Vasconcelos
#
# Todos os arquivos que constituem este software sao distribuidos
# sob a licenca MIT (disponivel em mit-license.org)
#
# Descricao
# =========
#
# Executa o treinamento da rede SOM a partir do conjunto de entradas x,
# da dimensao de cada instancia em x, da arquitetura da rede (i.e. dimensoes
# do reticulo bidimensional na camada de saida), do numero de epocas de
# treinamento e dos parametros sigma_0 e eta_0 e das respectivas constantes
# de tempo para decaimento.
#
# Entradas:
#   x: conjunto de instancias de entrada
#   m: dimensao das instancias de entrada
#   arq: dimensoes do reticulo bidimensional da rede (camada de saida)
#   N: numero de epocas de treinamento da rede
#   sigma_0: parametro sigma inicial da rede
#   t1: constante de decaimento de sigma
#   eta_0: parametro eta inicial da rede
#   t2: constante de decaimento de eta
#
# Saidas:
#   w: vetor de pesos obtido para a rede
#
# Autor
# =====
#
# Eduardo Vasconcelos
# <eduardovasconcelos@usp.br>
#

function w = treinasom(x, m, arq, N, sigma_0, t1, eta_0, t2)
	
	w = {}; # pesos
	
	# inicializacao aleatoria do vetor de pesos
	for i=1:arq(1)
		for j=1:arq(2)
			w{i,j} = rand(1, m);
		end
	end
	
	for n=1:N
		clc
		printf("n: %d/%d\n", n, N);
		for v=1:size(x)(1) # para cada vetor de entrada x
		
			# competicao
			[ i_min j_min y ] = calculasaidasom(x(v,:), w, m, arq);
			
			# cooperacao
			d = distancias(i_min, j_min, arq); # d(i,j): distancia lateral de cada
												# neuronio i,j ao neuronio vencedor
			sigma = novosigma(sigma_0, n-1, t1); # calculo do novo sigma
			h = vizinhanca(d, sigma); # h(i,j): vizinhanca topologica do neuronio
										# i,j com referencial no neuronio vencedor
			
			# adaptacao sinaptica
			eta = novoeta(eta_0, n-1, t2); # calculo do novo eta (tx de aprendizagem)
			
			for i=1:arq(1)
				for j=1:arq(2)
				
					w{i,j} = w{i,j} .+ eta .* ( h(i,j) .* (x(v,:).-w{i,j}) ); # atualizacao de pesos
					
				end
			end
			
		end
	end
	
end
