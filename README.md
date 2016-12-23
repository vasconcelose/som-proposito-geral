# som-proposito-geral

Implementacao de rede neural SOM de proposito geral em Octave.

## LICENCA

Copyright (c) 2016 Eduardo Santos Medeiros de Vasconcelos

Permission is hereby granted, free of charge, to any person obtaining 
a copy of this software and associated documentation files (the 
“Software”), to deal in the Software without restriction, including 
without limitation the rights to use, copy, modify, merge, publish, 
distribute, sublicense, and/or sell copies of the Software, and to 
permit persons to whom the Software is furnished to do so, subject to 
the following conditions:

The above copyright notice and this permission notice shall be included 
in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS 
OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF 
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. 
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY 
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, 
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE 
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

## AUTOR

Eduardo S. M. de Vasconcelos | eduardovasconcelos@usp.br
<br>NUSP 7656724 | Universidade de Sao Paulo
<br>Escola de Engenharia de Sao Carlos & Instituto de Ciencias Matematicas e de Computacao

## GUIA

Esta secao descreve a utilizacao basica desta implementacao de
Self Organizing Map (SOM). Vide relatorio de projeto em
"RelatorioProjeto2RedesNeuraisEduardoVasconcelos.pdf" para mais
informacao a respeito deste projeto.

Este trabalho foi desenvolvido em Octave. Para executa-lo eh necessario
que o Octave esteja devidamente instalado no seu computador.

### Como gerar um mapa com uma rede SOM utilizando esta implementacao?

Para gerar um mapa com a rede SOM eh preciso chamar som.m como abaixo.

$ octave som.m --treina \<numero de epocas de treinamento\> \<tamanho do lado do reticulo bidimensional da rede\>

e.g. $ octave som.m --treina 100 10<br>
     $ octave som.m --treina 50 20

Esta chamada cria dois arquivos de saida, a saber:
mapa.png -> grafico com o mapa obtido pela rede
somobj.txt -> arquivo txt de serializacao de objeto do octave contendo um
    objeto SOMObj, necessario para validar o resultado da rede. Este arquivo contem
    o desvio padrao inicial das gaussianas da rede (sigma_0), a taxa de aŕendizado
    inicial da rede (eta_0), as respectivas constantes de decaimento (t1 e t2), a
    arquitetura (arq) da rede, definida em termos do lado do reticulo bidimensional
    da rede, de forma que arq = [ 10 10 ] representa uma rede cuja camada de saida eh
    constituida de um reticulo bidimensional de lado 10, os exemplos de treinamento (x)
    da base de dados utilizada na rede, a dimensao (m) dos exemplos de treinamento, o
    conjunto de pesos (w) da rede, a matriz de saida (mat_y) representativa do mapa que a
    rede obteve e ainda os objetos xScat e yScat, que auxiliam o scatter plot do mapa
    tanto no treinamento quanto na validacao do resultado da rede.

### Como testar uma rede SOM ja treinada utilizando esta implementacao?

Antes de testar uma SOM eh preciso que ela tenha sido devidamente treinada.
Deve existir um arquivo txt de objeto SOMObj devidamente serializado (o
treinamento faz isso automaticamente). Para testar uma rede SOM eh preciso
chamar som.m como abaixo.

$ octave som.m --valida

Esta chamada cria o arquivo classes.png, que contem um grafico representando o reticulo
bidimensional de saida da rede, sobre o qual sao colocados simbolos que representam cada
classe de entrada que ativa o neuronio na posicao correspondente do reticulo.

### Como modificar os parametros da SOM?

Os parametros da SOM (sigma_0, t1, eta_0, t2 e base) podem ser modificados no comeco do
arquivo som.m. Cada parametro esta identificado por um comentario em som.m.
