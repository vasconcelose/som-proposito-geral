# neuronio.m
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
# Calcula valor de saida de um neuronio da rede, definido pela
# distancia cartesiana entre os pesos do neuronio e a instancia
# de entrada que lhe eh apresentada.
#
# Entradas:
#   x: instancia de entrada
#   w: vetor de pesos do neuronio
#
# Saidas:
#   v: distancia entre o vetor de pesos do neuronio e a instancia
#       apresentada
#
# Autor
# =====
#
# Eduardo Vasconcelos
# <eduardovasconcelos@usp.br>
#

function v = neuronio(x, w)

	v = sqrt(sum( (x - w).^2 ));

end
