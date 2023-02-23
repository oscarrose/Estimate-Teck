import React from "react";
import { Button } from "antd";
import { PlusOutlined } from "@ant-design/icons";
import TableEmpoyee from "./TableEmpoyee";
import ModalFormEmployee from "./ModalFormEmployee";

function ModuloEmployee() {
  return (
    <div className="grid grid-rows-2 ">
      <div className="justify-self-end row-span-2 m-2">
        <Button type="primary" icon={<PlusOutlined />}>
          Nuevo empleado
        </Button>
      </div>
      <div>
        <TableEmpoyee />
      </div>
      <ModalFormEmployee/>
    </div>
  );
}

export default ModuloEmployee;
