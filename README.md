# 📑 Actify — Organize. Estruture. Execute.

Status: **Em desenvolvimento**
License: Educacional
Plataforma: **Flutter • Dart • Android Studio**

---

## 🚀 Actify

O **Actify** é um aplicativo de gerenciamento de tarefas (To-Do List) desenvolvido em **Flutter**, com foco em organização pessoal, produtividade e simplicidade.

O projeto prioriza:

* código limpo
* arquitetura organizada
* persistência de dados local
* experiência de uso fluida
* boas práticas de desenvolvimento

> Um app simples, bem feito, estruturado como projeto profissional.

---

## 🎯 Objetivo do Projeto

Criar uma aplicação funcional de tarefas que sirva como projeto educacional e técnico, demonstrando:

* organização de código
* separação de responsabilidades
* uso de arquitetura
* versionamento correto
* estrutura profissional

---

## 🚀 Funcionalidades

### ✅ Funcionais

* 📋 Listagem de tarefas
* ➕ Criação de tarefas

    * Título
    * Descrição
    * Prioridade (Baixa, Média, Alta)
* ✔️ Marcar tarefa como concluída
* 🗑️ Exclusão de tarefas (swipe ou botão)

### 🌟 Diferenciais

* 💾 Persistência de dados local
* 🎯 Organização automática
* 🎨 Interface moderna
* 📱 UX intuitiva
* 🧠 Código estruturado
* 🧱 Arquitetura em camadas

---

## 🏗️ Arquitetura do Projeto

O Actify utiliza uma estrutura baseada em **MVVM + Layered Architecture**, garantindo separação de responsabilidades e escalabilidade:

```
UI → ViewModel → Repository → Data → Storage
```

### Camadas:

* **Models** → Estrutura de dados (TaskModel)
* **Views (UI)** → Telas do app
* **ViewModels** → Lógica, estado e regras
* **Repositories** → Ponte entre UI e dados
* **Services** → Persistência local
* **Widgets** → Componentes reutilizáveis

---

## 💾 Persistência de Dados

Persistência local utilizando:

* **Sqlflite**

Garantindo que os dados não sejam perdidos ao fechar o aplicativo.

---

## 🎨 UI/UX

* Interface limpa
* Cores consistentes
* Hierarquia visual clara
* Componentes reutilizáveis
* Foco em usabilidade

---

## 🔁 Fluxo da Aplicação

```
Tela de Listagem
   ↓
Botão Adicionar
   ↓
Tela de Cadastro
   ↓
Salvar Tarefa
   ↓
Volta para Listagem
```

---

## 🎨 Protótipo

Protótipo desenvolvido no Canva:

🔗 https://www.canva.com/design/DAG_2J6JB4w/UKa3x2meCcsi2MTLaHDTpg/edit?utm_content=DAG_2J6JB4w&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton

---

## 🛠️ Tecnologias Utilizadas

* Flutter
* Dart
* Android Studio

---

## 📥 Como rodar o projeto

Clone o repositório:

```
git clone https://github.com/seu-usuario/actify.git
```

Instale as dependências:

```
flutter pub get
```

Execute o app:

```
flutter run
```

---

## 📈 Evolução do Desenvolvimento

Este repositório documenta a evolução do projeto através de commits organizados:

```
init: estrutura inicial
feat: model task
feat: persistência local
feat: tela de cadastro
feat: tela de listagem
feat: prioridade
feat: conclusão de tarefa
feat: exclusão de tarefa
style: ajustes UI
refactor: organização de arquitetura
```

---


## 👨‍💻 Autor

Pedro Antonio Cruz Lanaro

---

## 📜 Licença

Projeto com finalidade educacional.

---

✨ **Actify** — Transformando tarefas em ação.
