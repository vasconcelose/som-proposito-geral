# distancias.m
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
# Calcula matriz de distancias cartesianas entre o neuronio apontado
# por i_min, j_min e os demais neuronios no reticulo bidimensional da
# rede SOM (referenciado pela arquitetura da rede).
#
# Entradas:
#   i_min: indice de linha do neuronio de referencia para o calculo
#           das distancias
#   j_min: indice de coluna do neuronio de referencia para o calculo
#           das distancias
#   arq: arquitetura da rede SOM (i.e. dimensoes LinhasxColunas do
#           reticulo bidimentsional)
#
# Saidas:
#   d: matriz de distancias cartesianas do neuronio de referencia
#           i_min, j_min aos demais neuronios da rede. Cada posicao de
#           d representa um neuronio do reticulo bidimensional
#
# Autor
# =====
#
# Eduardo Vasconcelos
# <eduardovasconcelos@usp.br>
#

function d = distancias(i_min, j_min, arq)
	
	d = [];
	
	for i=1:arq(1)
		for j=1:arq(2)
			d(i,j) = sqrt((i - i_min)^2 + (j - j_min)^2);
		end
	end	
	
end
