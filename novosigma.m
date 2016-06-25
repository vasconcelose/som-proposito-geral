# novosigma.m
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
# Calcula novo valor de sigma da rede a partir dos valores sigma inicial,
# epoca de treinamento e constante de tempo definida para atualizacao
# de sigma da rede utilizando relacao exponencial.
#
# Entradas:
#   sigma_0: sigma inicial da rede
#   n: epoca de treinamento
#   t: constante de tempo para atualizacao de sigma
#
# Saidas:
#   sigma: novo valor de sigma (para a epoca de treinamento atual)
#
# Autor
# =====
#
# Eduardo Vasconcelos
# <eduardovasconcelos@usp.br>
#

function sigma = novosigma(sigma_0, n, t)

	sigma = sigma_0 * exp( -n/t );

end
