import React,{useState} from "react";
import { Button } from "antd";
import { PlusOutlined } from "@ant-design/icons";
import TableEmpoyee from "./TableEmpoyee";
import ModalFormEmployee from "./ModalFormEmployee";

function ModuloEmployee() {

  const [modalFormEmployee, setModalFormEmployee]=useState(false)
  return (
    <div className="grid grid-rows-2 ">
      <div className="justify-self-end row-span-2 m-2">
        <Button type="primary" icon={<PlusOutlined />}
        onClick={()=>setModalFormEmployee(true)}
        >
          Nuevo empleado
        </Button>
      </div>
      <div>
        <TableEmpoyee />
      </div>
      <ModalFormEmployee modalFormEmployee={modalFormEmployee} setModalFormEmployee={setModalFormEmployee}/>
    </div>
  );
}

export default ModuloEmployee;
