#encoding: utf-8
require 'machinist/caching/active_record'

Group.blueprint do
  title {"Contrato"}
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

User.blueprint do
  name        {"Jhon Doe"}
  email       {"jhon.doe@salus.com"}
  password    {"123456"}
end