<a href="http://www.ufsc.br">![Brasão UFSC](http://s4.postimg.org/c280tq1d9/brasao_UFSC.png)</a>

# Trabalho de Implementação de Estrutura de Grafos

## Participantes

+ [Nicholas Marcaccini](https://github.com/n1c0l4s)
+ [Thiago Senhorinha Rose](https://github.com/thisenrose)

## Descrição

Devemos implementar uma estrutura de Grafo capaz de realizar as operações abaixo

<table border="" cellpadding="2">
    <caption>
      <b>Ações Básicas</b>
    </caption>
    <tbody><tr>
      <td>G.<font color="#800040"><b>add_vertex</b></font>(v)</td>
      <td>"Adiciona um&nbsp;novo vértice em G"</td>
    </tr>
    <tr>
      <td>G.<font color="#800040"><b>remove_vertex</b></font>(v)</td>
      <td>"Remove um&nbsp; vértice de G, juntamente com todas as conexões"</td>
    </tr>
    <tr>
      <td>G.<font color="#800040"><b>connect</b></font>(v<sub>1</sub>,v<sub>2</sub>)</td>
      <td>"Conecta os vértices v<sub>1</sub> e v<sub>2</sub> em G"</td>
    </tr>
    <tr>
      <td>G.<font color="#800040"><b>disconnect</b></font>(v<sub>1</sub>,v<sub>2</sub>)</td>
      <td>"Desconecta os vértices v<sub>1</sub> e v<sub>2</sub> em G"</td>
    </tr>
    <tr>
      <td>G.<font color="#800000"><b>order</b></font>
    <img width="24" height="13" align="Top" src="http://s23.postimg.org/xu11un0xz/seta.gif">Inteiro</td>
      <td>"Retorna o número de vértices de G"</td>
    </tr>
    <tr>
      <td>G.<font color="#800000"><b>vertices</b></font>
    <img width="24" height="13" align="Top" src="http://s23.postimg.org/xu11un0xz/seta.gif">Conjunto</td>
      <td>"Retorna um conjunto contendo os vértices de G"</td>
    </tr>
    <tr>
      <td>G.<font color="#800000"><b>random_vertex</b></font>
    <img width="24" height="13" align="Top" src="http://s23.postimg.org/xu11un0xz/seta.gif">Vertice</td>
      <td>"Retorna um vértice qualquer de G"</td>
    </tr>
    <tr>
      <td>G.<font color="#800000"><b>adjacents</b></font>(v)<img width="24" height="13" align="Top" src="http://s23.postimg.org/xu11un0xz/seta.gif">Conjunto</td>
      <td>"Retorna um conjunto contendo os vértices adjacentes a <i>v</i>
    em G"</td>
    </tr>
    <tr>
      <td>G.<font color="#800000"><b>degree</b></font>(v)<img width="24" height="13" align="Top" src="http://s23.postimg.org/xu11un0xz/seta.gif">Inteiro</td>
      <td>"Retorna o&nbsp;número de vértices adjacentes a <i>v</i>
    em G"</td>
    </tr>
  </tbody></table>

  <table border="" cellpadding="2">
      <caption>
    <b>Ações Derivadas</b>
      </caption>
      <tbody><tr>
    <td>G.<b><a href="http://www.inf.ufsc.br/grafos/represen/algoritmos/grafo-imp.html#regular">regular?</a></b><img width="24" height="13" align="Top" src="http://s23.postimg.org/xu11un0xz/seta.gif">Boolean</td>
    <td>"Verifica&nbsp;se todos os&nbsp;vértices de G possuem o mesmo
      grau"</td>
      </tr>
      <tr>
    <td>G.<b><a href="http://www.inf.ufsc.br/grafos/represen/algoritmos/grafo-imp.html#completo">complete?</a></b><img width="24" height="13" align="Top" src="http://s23.postimg.org/xu11un0xz/seta.gif">Boolean</td>
    <td>"Verifica&nbsp;se cada&nbsp;vértice de G está conectados
      <br>
      &nbsp;a todos os&nbsp;outros vértices"</td>
      </tr>
      <tr>
    <td>G.<b><a href="http://www.inf.ufsc.br/grafos/represen/algoritmos/grafo-imp.html#fechoTransitivo">transitive_closure_of</a></b>(v)<img width="24" height="13" align="Top" src="http://s23.postimg.org/xu11un0xz/seta.gif">Conjunto</td>
    <td>"Retorna um conjunto contendo todos os vértices de G que<br>
      &nbsp;são transitivamente alcancáveis partindo-se de <i>v</i>"</td>
      </tr>
      <tr>
    <td>G.<b><a href="http://www.inf.ufsc.br/grafos/represen/algoritmos/grafo-imp.html#conexo">connected?</a></b><img width="24" height="13" align="Top" src="http://s23.postimg.org/xu11un0xz/seta.gif">Boolean</td>
    <td>"Verifica&nbsp;se existe pelo menos um caminho que entre <br>
      &nbsp;cada par de vértices de G"</td>
      </tr>
      <tr>
    <td>G.<b><a href="http://www.inf.ufsc.br/grafos/represen/algoritmos/grafo-imp.html#arvore">tree?</a></b><img width="24" height="13" align="Top" src="http://s23.postimg.org/xu11un0xz/seta.gif">Boolean</td>
    <td>"Verifica&nbsp;se não há ciclos em G"</td>
      </tr>
    </tbody></table>

Além disso, implementar algum algoritmo (de busca, de solução de algum problema, etc) que a teste.

### Critérios de Avaliação

+ Estrutura do código;
+ Legibilidade do código;
+ Eficácia e eficiência (esperada complexidade O(1) para as operações básicas)