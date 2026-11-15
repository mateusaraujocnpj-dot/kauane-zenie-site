# Site Kauane Zenie Studio

Site da Kauane Zenie Studio (extensão de cílios, sobrancelhas e curso), para o link da bio do Instagram.

- `index.html`: página única, responsiva, sem dependências de build. A página do curso abre em `/#curso`.
- `assets/img/`: fotos do site (WebP).
- `vercel.json`: cache longo para as imagens.
- `supabase/schema.sql`: tabelas que guardam os pedidos de agendamento e de inscrição no curso.

## Publicar
Importe este repositório na Vercel (Framework: **Other**, sem comando de build, diretório de saída: raiz).

## WhatsApp
No `index.html`, procure `const CONFIG` e coloque o número em `whatsapp`, com DDI e DDD, só dígitos (ex.: `5541999999999`).

## Supabase
1. Rode `supabase/schema.sql` no SQL Editor do projeto.
2. No `CONFIG` do `index.html`, preencha `supabaseUrl` e `supabaseKey` (chave *publishable*).
Os pedidos aparecem nas tabelas `agendamentos` e `inscricoes_curso`, e o cliente continua indo para o WhatsApp normalmente.
