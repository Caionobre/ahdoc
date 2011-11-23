#encoding: utf-8
require 'machinist/caching/active_record'

User.blueprint do
  name        {"Jhon Doe"}
  email       {"jhon.doe@salus.com"}
  password    {"123456"}
end

System.blueprint do
  name       {'ahdoc'}
end

Database.blueprint do
  system_id {System.make!.id}
  name      {'ahdoc_test'}
end

Table.blueprint do
  database
  name      {'Users'}
end

Field.blueprint do
  table
  name         {'id'}
  storage_type {Constant::Field::StorageType::PRIMARY_KEY}
  nullable     {false}
  description  {'This is a primary key`s field  of the table Users'}
end

Group.blueprint do
  system_id {System.make!.id}
  title     {"User"}
end

Actor.blueprint do
  group
  name {"Gerente de contrato"}
end

Document.blueprint do
  actor
  group
  title {"Documento contrato"}
end

Precondition.blueprint do
  document
  flow {"Gestor deve ter permissão para cadastrar"}
  order {1}
end

BasicFlow.blueprint do
  document
  flow {"Gestor inicia caso de uso"}
  order {1}
end

AlternativeFlow.blueprint do
  document
  title {"Fluxo Alternativo 01"}
  order {1}
end

Item.blueprint do
  alternative_flow
  flow {"Alternativo A1"}
  order {1}
end

Poscondition.blueprint do
  document
  flow {"Evento liberado pra uso"}
  order {1}
end

Prototype.blueprint do
  document
  description {"Figura 1"}
  link {"/home/fig1.png"}
end