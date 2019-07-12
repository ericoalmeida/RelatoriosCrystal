CREATE OR ALTER VIEW VWDANFE(
    EMISSCODIGO,
    EMISSTIPO,
    EMISSNOMEFANTASIA,
    EMISSRAZAOSOCIAL,
    EMISSCPFCNPJ,
    EMISSINSCMUNICIPAL,
    EMISSRGIE,
    EMISSCNAE,
    EMISSCRT,
    EMISSENDERECO,
    EMISSORNUMERO,
    EMISSBAIRRO,
    EMISSCIDADE,
    EMISSORCEP,
    EMISSTELEFONE,
    EMISSEMAIL,
    EMISSHOMEPAGE,
    NFISCIDNOTAFISCAL,
    NFISCMODELO,
    NFISCSERIE,
    NFISCSTATUS,
    NFISCNUMERO,
    NFISCTIPO,
    NFISCCHAVEACESSO,
    NFISCEMISSAO,
    NFISCOPERACAO)
AS
Select

Emiss.codigo                     as EmissCodigo,
Emiss.tipo                       as EmissTipo,
Emiss.nomefantasia               as EmissNomeFantasia,
Emiss.razaosocial                as EmissRazaoSocial,
Emiss.cpfcnpj                    as EmissCPFCNPJ,
Emiss.imunicipal                 as EmissInscMunicipal,
Emiss.rgie                       as EmissRGIE,
Emiss.cnae                       as EmissCNAE,
Emiss.crt                        as EmissCRT,
Emiss.endereco                   as EmissEndereco,
Emiss.numero                     as EmissorNumero,
Emiss.bairro                     as EmissBairro,
EmissCid.nome||'/'||EmissCid.uf  as EmissCidade,
Emiss.cep                        as EmissorCEP,
Emiss.telefone                   as EmissTelefone,
coalesce(Emiss.email, '')        as EmissEmail,
coalesce(Emiss.homepage, '')     as EmissHomePage,
NFisc.idnota                     as NFiscIdNotaFiscal,
NFisc.modelo                     as NFiscModelo,
lpad(NFisc.serie, 3 ,'0')        as NFiscSerie,
NFisc.status                     as NFiscStatus,
lpad(NFisc.cnf, 9, '0')          as NFiscNumero,
NFisc.tpnf                       as NFiscTipo,
NFisc.chave                      as NFiscChaveAcesso,
NFisc.dataemissao                as NFiscEmissao,
NFisc.natop                      as NFiscOperacao


From

TGerEmpresa Emiss
Left Join TGerCidade EmissCid on (EmissCid.idcidade = Emiss.idcidade)
Left Join TNfeNota NFisc on (NFisc.empresa = Emiss.codigo)
;
