-- Pedidos que chegam pelo site da Kauane Zenie Studio.
-- Rode no SQL Editor do Supabase. O site só consegue INSERIR; ler os pedidos só pelo painel.

create table if not exists public.agendamentos (
  id bigint generated always as identity primary key,
  criado_em timestamptz not null default now(),
  nome text not null check (char_length(nome) between 2 and 120),
  cilios text check (char_length(cilios) <= 80),
  tipo text check (tipo in ('Aplicação','Manutenção')),
  sobrancelha text check (char_length(sobrancelha) <= 80),
  data_preferencia date,
  periodo text check (periodo in ('Manhã','Tarde','Noite')),
  primeira_vez text check (char_length(primeira_vez) <= 40),
  observacao text check (char_length(observacao) <= 1000),
  quer_localizacao boolean not null default false,
  origem text not null default 'site' check (char_length(origem) <= 20)
);

create table if not exists public.inscricoes_curso (
  id bigint generated always as identity primary key,
  criado_em timestamptz not null default now(),
  nome text not null check (char_length(nome) between 2 and 120),
  experiencia text check (char_length(experiencia) <= 80),
  pagamento text check (char_length(pagamento) <= 80),
  origem text not null default 'site' check (char_length(origem) <= 20)
);

alter table public.agendamentos enable row level security;
alter table public.inscricoes_curso enable row level security;

drop policy if exists "site insere agendamentos" on public.agendamentos;
create policy "site insere agendamentos" on public.agendamentos
  for insert to anon with check (true);

drop policy if exists "site insere inscricoes" on public.inscricoes_curso;
create policy "site insere inscricoes" on public.inscricoes_curso
  for insert to anon with check (true);

revoke all on public.agendamentos, public.inscricoes_curso from anon;
grant insert (nome, cilios, tipo, sobrancelha, data_preferencia, periodo, primeira_vez, observacao, quer_localizacao, origem) on public.agendamentos to anon;
grant insert (nome, experiencia, pagamento, origem) on public.inscricoes_curso to anon;
