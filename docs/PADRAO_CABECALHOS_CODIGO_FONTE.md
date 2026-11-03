# 📜 Padrão Canônico de Cabeçalhos de Código-Fonte
## Ecossistema ZeroNexus & Projetos de Fábio Linhares

> **Norma Técnica de Documentação de Cabeçalhos, Identidade de Autoria, Rastreabilidade e Governança de Software.**

---

## 1. Princípios e Justificativa

Um cabeçalho profissional de código-fonte deve permitir identificar **autoria, contato, finalidade, versão, histórico, licença, dependências e condições de execução** sem que seja necessário examinar todo o corpo do arquivo.

Este padrão estabelece as diretrizes canônicas adotadas em todos os repositórios públicos e privados do ecossistema, abrangendo Python, Bash/Shell, C/C++, Rust, JavaScript/TypeScript e SQL.

---

## 2. Identidades e E-mails Canônicos de Fábio Linhares

A autoria deve sempre referenciar **Fábio Linhares**, acompanhada do e-mail específico correspondente ao contexto do projeto:

| Contexto de Aplicação | E-mail Canônico | Website / Filiação |
| :--- | :--- | :--- |
| **Geral, Open Source & Ferramentas Pessoais** | `fabiolinharez@gmail.com` | `https://fabiolinhares.com.br/` |
| **Pesquisa Científica & Academia (UFAL)** | `fl@ic.ufal.br` | Instituto de Computação — UFAL |
| **Docência & Governança Acadêmica (Infnet)** | `fabio.slinhares@prof.infnet.edu.br` | Instituto Infnet |

> [!IMPORTANT]
> O e-mail pessoal/open source termina estritamente em **`z`** (`fabiolinharez@gmail.com`), nunca em `s`.

---

## 3. Modelo Canônico para Python (`.py`)

```python
#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# =============================================================================
# PROJETO      : [Nome do Projeto]
# ARQUIVO      : [nome_do_arquivo.py]
# DESCRIÇÃO    : [Descrição objetiva da finalidade deste módulo.]
#
# AUTOR        : Fábio Linhares
# E-MAIL       : fabiolinharez@gmail.com  # ou fl@ic.ufal.br / fabio.slinhares@prof.infnet.edu.br
# ORGANIZAÇÃO  : [ZeroNexus Ecosystem / IC-UFAL / Instituto Infnet]
# WEBSITE      : https://fabiolinhares.com.br/
# REPOSITÓRIO  : https://github.com/[usuario]/[repositorio]
#
# VERSÃO       : 1.0.0
# STATUS       : Estável
# CRIAÇÃO      : AAAA-MM-DD
# ATUALIZAÇÃO  : AAAA-MM-DD
# PYTHON       : >= 3.8
# PLATAFORMA   : GNU/Linux / Multiplataforma
#
# DEPENDÊNCIAS : [Python Standard Library / pacotes listados em pyproject.toml]
# INSTALAÇÃO   : pip install .
# EXECUÇÃO     : python3 nome_do_arquivo.py [opções]
#
# LICENÇA      : MIT (ou GPL-2.0 / GPL-3.0)
# COPYRIGHT    : (c) 2026 Fábio Linhares
# SPDX-License-Identifier: MIT
#
# HISTÓRICO
# -----------------------------------------------------------------------------
# 1.0.0 | AAAA-MM-DD | Fábio Linhares
#       | Implementação inicial.
#
# OBSERVAÇÕES
# -----------------------------------------------------------------------------
# - Consulte README.md para documentação geral.
# - Não armazene credenciais ou informações sensíveis neste arquivo.
# =============================================================================
"""
Descrição resumida do módulo no padrão PEP 257.

Este módulo implementa [funcionalidade principal detalhada].

Exemplo:
    $ python3 nome_do_arquivo.py --help
"""

__author__ = "Fábio Linhares"
__email__ = "fabiolinharez@gmail.com"
__version__ = "1.0.0"
__license__ = "MIT"
__status__ = "Stable"
```

---

## 4. Modelo Canônico para Shell / Bash (`.sh`)

```bash
#!/usr/bin/env bash
# =============================================================================
# PROJETO      : [Nome do Projeto]
# ARQUIVO      : [nome_do_script.sh]
# DESCRIÇÃO    : [Descrição objetiva da finalidade do script.]
#
# AUTOR        : Fábio Linhares
# E-MAIL       : fabiolinharez@gmail.com  # ou fl@ic.ufal.br / fabio.slinhares@prof.infnet.edu.br
# ORGANIZAÇÃO  : [ZeroNexus Ecosystem / IC-UFAL / Instituto Infnet]
# WEBSITE      : https://fabiolinhares.com.br/
# REPOSITÓRIO  : https://github.com/[usuario]/[repositorio]
#
# VERSÃO       : 1.0.0
# STATUS       : Estável
# CRIAÇÃO      : AAAA-MM-DD
# ATUALIZAÇÃO  : AAAA-MM-DD
# INTERPRETADOR: Bash >= 5.0
# PLATAFORMA   : GNU/Linux
#
# DEPENDÊNCIAS : bash, coreutils
# EXECUÇÃO     : bash nome_do_script.sh
# PERMISSÕES   : chmod +x nome_do_script.sh
#
# LICENÇA      : MIT (ou GPL-2.0 / GPL-3.0)
# COPYRIGHT    : (c) 2026 Fábio Linhares
# SPDX-License-Identifier: MIT
#
# HISTÓRICO
# -----------------------------------------------------------------------------
# 1.0.0 | AAAA-MM-DD | Fábio Linhares
#       | Implementação inicial.
#
# OBSERVAÇÕES
# -----------------------------------------------------------------------------
# - Evitar execução com privilégios elevados sem necessidade explícita.
# - Validar argumentos antes de executar comandos destrutivos.
# - Consultar README.md para instruções adicionais.
# =============================================================================

set -Eeuo pipefail
```

---

## 5. Modelo Canônico para C / C++ / Rust / JavaScript / TypeScript

```c
/**
 * ============================================================================
 * PROJETO      : [Nome do Projeto]
 * ARQUIVO      : [nome_do_arquivo.cpp / .hpp / .js / .rs]
 * DESCRIÇÃO    : [Descrição objetiva da finalidade do módulo.]
 *
 * AUTOR        : Fábio Linhares
 * E-MAIL       : fabiolinharez@gmail.com  # ou fl@ic.ufal.br / fabio.slinhares@prof.infnet.edu.br
 * ORGANIZAÇÃO  : [ZeroNexus Ecosystem / IC-UFAL / Instituto Infnet]
 * WEBSITE      : https://fabiolinhares.com.br/
 * REPOSITÓRIO  : https://github.com/[usuario]/[repositorio]
 *
 * VERSÃO       : 1.0.0
 * STATUS       : Estável
 * CRIAÇÃO      : AAAA-MM-DD
 * ATUALIZAÇÃO  : AAAA-MM-DD
 * PADRÃO       : [C++23 / C17 / Rust 2021 / Node.js >= 20]
 * PLATAFORMA   : GNU/Linux / POSIX
 *
 * DEPENDÊNCIAS : [Listagem de bibliotecas]
 * COMPILAÇÃO   : g++ -std=c++23 ... (ou cargo build --release)
 *
 * LICENÇA      : MIT (ou GPL-2.0 / GPL-3.0)
 * COPYRIGHT    : (c) 2026 Fábio Linhares
 * SPDX-License-Identifier: MIT
 *
 * HISTÓRICO
 * ----------------------------------------------------------------------------
 * 1.0.0 | AAAA-MM-DD | Fábio Linhares
 *       | Implementação inicial.
 *
 * OBSERVAÇÕES
 * ----------------------------------------------------------------------------
 * - Documentação disponível no README.md.
 * ============================================================================
 */
```

---

## 6. Convenções de Engenharia e Governança

1. **SPDX-License-Identifier:** Usar sempre a sintaxe padrão `SPDX-License-Identifier: MIT` (ou a licença pertinente), padronizada pela Linux Foundation.
2. **Versionamento Semântico (SemVer 2.0.0):**
   - `MAJOR`: Quebras de compatibilidade ou alterações arquiteturais.
   - `MINOR`: Novas funcionalidades compatíveis.
   - `PATCH`: Correções de bugs, ajustes de documentação ou pequenos refinamentos.
3. **Conventional Commits:** Todas as alterações devem seguir commits estruturados:
   - `feat:` Nova funcionalidade
   - `fix:` Correção de bug
   - `docs:` Alterações puramente em documentação ou cabeçalhos
   - `refactor:` Refatoração de código sem alteração funcional
   - `test:` Inclusão ou ajuste de testes
4. **Respeito à Privacidade:** NUNCA incluir em cabeçalhos dados sensíveis, credenciais, chaves de API, tokens, senhas ou topologia interna de redes privadas.
