#
# Copyright (c) 2016 Eduardo Santos Medeiros de Vasconcelos
#
# Todos os arquivos que constituem este software sao distribuidos
# sob a licenca MIT (disponivel em mit-license.org)
#
# Descricao
# =========
#
# Programa principal da rede SOM implementada. Pode ser chamado com 
# parametros de treinamento e de validacao do mapa obtido, para o caso
# de conjuntos de dados que tenham rotulos disponiveis. A base de dados
# utilizada deve estar em formato analogo ao do arquivo data/iris.txt,
# distribuido junto com este projeto. Para o caso do treinamento, o
# programa salva os arquivos somobj.txt (serializacao de objetos do Octave
# que define a rede treinada) e o arquivo mapa.png, representando o
# mapa bidimensional obtido pela rede. Para o caso da validacao, utiliza
# um arquivo somobj.txt previamente salvo e cria o arquivo classes.png,
# que exibe as classes para as quais cada neuronio eh ativado. Em ambos
# os casos, o programa utiliza a base definida pela variavel "base",
# definida na linha 46 deste arquivo.
#
# Guia rapido de utilizacao
# =========================
#
# 1) Treinamento
#   $ octave mlp.m --treina <numero de epocas de treinamento>\
#<lado do reticulo bidimensional>
#   e.g. $ octave mlp.m --treina 100 10
#
# 2) Validacao
#   $ octave mlp.m --valida
#
# Autor
# =====
#
# Eduardo Vasconcelos
# <eduardovasconcelos@usp.br>
#

clc
clear all

args = argv;

base = "data/iris.txt"; # base de dados

if (strcmp(args{1}, "--treina") == 1)

	# Parametros dos arquivos de entrada e saida

	fScatter = 25; # tamanho maximo no scatter plot

	# Parametros da rede
	N = str2num(args{2}); # numero de epocas de treinamento
	sigma_0 = 5; # desvio padrao inicial da gaussiana
	t1 = 1.2; # constante de tempo (para recalculo de sigma)
	eta_0 = 0.5; # taxa inicial de aprendizado
	t2 = 1.2; # constante de tempo (para recalculo de n)
	ladoMapa = str2num(args{3});
	arq = [ ladoMapa ladoMapa ]; # linhas e colunas do mapa, respectivamente

	x = dlmread(base)(2:end,:)(:,2:end); # entradas sem label
	m = size(x)(2); # dimensao das entradas

	# Salvar objeto SOM para replicar experimento

	SOMObj.N = N;
	SOMObj.sigma_0 = sigma_0;
	SOMObj.t1 = t1;
	SOMObj.eta_0 = eta_0;
	SOMObj.t2 = t2;
	SOMObj.arq = arq;
	SOMObj.x = x;
	SOMObj.m = m;

	# Treianmento da rede

	w = treinasom(x, m, arq, N, sigma_0, t1, eta_0, t2);

	# Impressao do mapa obtido

	mat_y = zeros(arq(1), arq(2)); # saida da rede

	for v=1:size(x)(1)
		[ i j y ] = calculasaidasom(x(v,:), w, m, arq);
		mat_y(i,j) = mat_y(i,j) + 1;
	end

	SOMObj.w = w; # pesos obtidos
	SOMObj.mat_y = mat_y; # matriz de mapa obtido

	[ mgY mgX ] = meshgrid(1:size(mat_y)(1), 1:size(mat_y)(2));
	mg = reshape(cat(2, mgY', mgX'), [], 2);
	xScat = mg(:,2)';
	yScat = mg(:,1)';

	scatter(xScat, yScat, fScatter .* atan(reshape(mat_y, 1, size( mat_y)(1)*size(mat_y)(2) )),'r', 'filled');
	grid on;
	grid minor on;
	axis("ij");
	xlim([ 1 size(mat_y)(2) ]);
	ylim([ 1 size(mat_y)(1) ]);
	print -dpng mapa.png;

	# Salvar objeto SOMObj

	SOMObj.xScat = xScat;
	SOMObj.yScat = yScat;
	save somobj.txt SOMObj;

elseif (strcmp(args{1}, "--valida") == 1)

	load somobj.txt SOMObj;
	
	cteMarcadores = [ 'r^'; 'gs'; 'bo'; 'rs'; 'go'; 'b^'; 'ro'; 'g^'; 'bs' ];
	cteMarcadores = cellstr(cteMarcadores);
	
	xCla = dlmread(base)(2:end,1); # labels das entradas
	
	marcadores = cell(size(SOMObj.mat_y)(1), size(SOMObj.mat_y)(2));
	
	for v=1:size(xCla)(1)
		[ i j y ] = calculasaidasom(SOMObj.x(v,:), SOMObj.w, SOMObj.m, SOMObj.arq);
		marcadores{i,j} = [ marcadores{i,j} xCla(v) + 1];
	end
	
	hold
	
	for i=1:size(SOMObj.mat_y)(1)
		for j=1:size(SOMObj.mat_y)(2)
			for k=1:length(marcadores{i,j})
			
				plot([ j ], [ i ], cteMarcadores(marcadores{i,j}(k))); # transposta
				
			end
			
		end
	end
	
	grid on;
	grid minor on;
	axis("ij");
	xlim([ 1 size(SOMObj.mat_y)(2) ]);
	ylim([ 1 size(SOMObj.mat_y)(1) ]);
	print -dpng classes.png;

end
