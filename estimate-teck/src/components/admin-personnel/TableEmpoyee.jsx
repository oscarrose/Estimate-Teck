import React from "react";
import { Space, Table } from "antd";

function TableEmpoyee() {
  const columns = [
    {
      title: "Nombre",
      dataIndex: "nombreCompleto",
    },
    {
      title: "Email",
      dataIndex: "email",
    },
    {
      title: "Identificación",
      dataIndex: "identificacion",
    },
    {
      title: "Teléfono residencial",
      dataIndex: "telefonoResidencial",
    },
    {
      title: "Celular",
      dataIndex: "celular",
    },
    {
      title: "Cargo",
      dataIndex: "cargo",
    },
    {
      title: "Cargo",
      dataIndex: "idCargo",
      hidden: true,
    },
    {
      title: "Dirección",
      dataIndex: "direccion",
    },
    {
      title: "Fecha creación",
      dataIndex: "fechaCreacion",
    },
    {
      title: "Acciones",
      render: (record) => (
        <Space size="middle">
          <a className="btnnavega" onClick={() => {}}>
            Modificar
          </a>
        </Space>
      ),
    },
  ].filter((item) => !item.hidden);

  return (
    <div>
      <Table
        columns={columns}
        // dataSource={data}
        rowKey={(record) => record.idEmpleado}
        pagination={{
          pageSize: 10,
        }}
        /*   scroll={{
          y: 300,
        }} */
        //loading={loanding}
      />
    </div>
  );
}

export default TableEmpoyee;
