# vizinhanca.m
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
# Calcula a matriz de vizinhanca h a partir da matriz de distancias d
# utilizando a funcao que define a distribuicao gaussiana em utilizacao
# na epoca de treinamento corrente pela rede
#
# Entradas:
#   d: matriz de distancias (calculada em distancias.m)
#   sigma: sigma corrente da rede
#
# Saidas:
#   h: matriz de vizinhanca da epoca de treinamento corrente
#
# Autor
# =====
#
# Eduardo Vasconcelos
# <eduardovasconcelos@usp.br>
#

function h = vizinhanca(d, sigma)

	h = exp( -(d.^2) / (2*sigma^2) );

end