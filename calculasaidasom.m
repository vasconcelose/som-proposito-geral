# calculasaidasom.m
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
# Calcula saida da rede SOM. Defina-se saida da rede como o neuronio
# que eh ativado pela entrada x recebida. O neuronio que ativa eh
# definido em termos de sua posicao (i_min, j_min) no reticulo bidimensional
#
# Entradas:
#   x: instancia de entrada da rede
#   w: conjunto de pesos da rede
#   m: dimensao da instancia de entrada
#   arq: arquitetura da rede (definida em termos das dimensoes de seu reticulo
#           bidimensional (LinhasxColunas)
#
# Saidas:
#   i_min: indice de linha do neuronio ativado pela entrada x
#   j_min: indice de coluna do neuronio ativado pela entrada x
#
# Autor
# =====
#
# Eduardo Vasconcelos
# <eduardovasconcelos@usp.br>
#
function [ i_min j_min y ] = calculasaidasom(x, w, m, arq)

	# pesquisa de menor valor i.e.
	# neuronio mais proximo da entrada
	y = [];
	v_min = Inf;
	
	for i=1:arq(1)
		for j=1:arq(2)
		
			v = neuronio(x, w{i,j});
			y(i,j) = v;
			
			# novo minimo
			if (v < v_min)
				v_min = v;
				i_min = i;
				j_min = j;
			end
			
		end
	end
	
end
