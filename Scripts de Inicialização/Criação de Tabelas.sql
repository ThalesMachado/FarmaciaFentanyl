create schema FarmaciaFentanyl;

create table endereco(
    endid serial primary key,
    uf enum ('AC', 'AL', 'AP', 'AM', 'BA', 'CE', 'DF', 'ES', 'GO', 'MA', 'MT', 'MS', 'MG', 'PA', 'PB', 'PR', 'PE', 'PI', 'RJ', 'RN', 'RS', 'RO', 'RR', 'SC', 'SP', 'SE', 'TO'),
    cidade varchar(50),
    bairro varchar(100);
    rua varchar(100),
    cep varchar(9),
    numero varchar(4),
    complemento varchar(50)
);

create table telefone(
    telid serial primary key,
    ddd char(2),
    tipo enum ('fixo', 'celular'),
    telefone char(9)
);

create table funcionario(
    matricula char(6) primary key,
    cpf char(14),
    salario decimal(10, 2),
    nome varchar(100),
    endereco bigint,
    telefone bigint,
    foreign key (endereco) references endereco(endid),
    foreign key (telefone) references telefone(telid) 
);

create table farmaceutico(
    regCRF char(8) primary key,
    matricula char(6),
    especialidade varchar(50),
    foreign key (matricula) references funcionario(matricula)
);

create table gerente(
    matricula char(6) primary key,
    setor varchar(50),
    foreign key (matricula) references funcionario(matricula)
);

create table franquia(
    franqid serial primary key,
    cnpj char(18),
    razaoSocial varchar(100),
    inscricaoEstadual varchar(15),
    matriculaResp char(6),
    endereco bigint,
    telefone bigint,
    foreign key (telefone) references telefone(telid),
    foreign key (endereco) references endereco(endid),
    foreign key (matricula) references funcionario(matricula)
);

create table equipamento(
    patrimonio char(10),
    descricao varchar(150),
    matriculaResp char(6),
    franqid bigint,
    dataCompra date,
    valorCompra decimal(10, 2),
    foreign key (matriculaRes) references funcionario(matricula),
    foreign key (franqid) references franquia(franqid)
);

create table cliente(
    cltid serial primary key,
    cpf char(14),
    dataNasc date,
    nome varchar(100),
    endereco bigint,
    telefone bigint,
    foreign key (endereco) references endereco(endid),
    foreign key (telefone) references telefone(telid)
);


