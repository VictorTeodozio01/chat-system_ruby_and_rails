---

## Testes

Este projeto possui testes para garantir a qualidade do código e o correto funcionamento das funcionalidades. As instruções abaixo mostram como executar testes para o **backend** (Rails) e o **frontend** (Vue.js).

### 1. Testes Backend

O backend usa o **RSpec** para testes unitários e de integração, e **SimpleCov** para cobertura de código.

#### Executando os Testes

1. Primeiro, certifique-se de que o container do backend está em execução. Se ele ainda não estiver, suba o ambiente:

    ```bash
    docker-compose up --build
    ```

2. Em seguida, execute os testes com o comando:

    ```bash
    docker-compose exec web rspec
    ```

#### Visualizando a Cobertura de Código

Após rodar os testes, o **SimpleCov** gera um relatório de cobertura em HTML no diretório `backend/coverage`. Abra o arquivo `index.html` no navegador para visualizar a cobertura de código:

```plaintext
backend/coverage/index.html
