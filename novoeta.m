# novoeta.m
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
# Calcula novo valor de eta da rede a partir dos valores eta inicial,
# epoca de treinamento e constante de tempo definida para atualizacao
# de sigma da rede utilizando relacao exponencial.
#
# Entradas:
#   eta_0: eta inicial da rede
#   n: epoca de treinamento
#   t: constante de tempo para atualizacao de eta
#
# Saidas:
#   eta: novo valor de eta (para a epoca de treinamento atual)
#
# Autor
# =====
#
# Eduardo Vasconcelos
# <eduardovasconcelos@usp.br>
#

function eta = novoeta(eta_0, n, t)

	eta = eta_0*exp(- n / t);

end
