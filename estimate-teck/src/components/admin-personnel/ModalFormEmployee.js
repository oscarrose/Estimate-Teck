import React, { useState } from "react";
import { Modal, Form, Input, Select, Spin, Button } from "antd";

const { Option } = Select;

function ModalFormEmployee({modalFormEmployee,setModalFormEmployee}) {
  const [form] = Form.useForm();
  const onReset = () => {
    form.resetFields();
  };

  return (
    <div>
      <Modal
        width={800}
        centered
        open={modalFormEmployee}
        onCancel={()=>setModalFormEmployee(false)}
        footer={[
          <Button key="Danger" type="primary" danger>
            Cancelar
          </Button>,
          <Button key="submit" type="primary">
            Guardar
          </Button>,
        ]}
      >
        <p className=" text-2xl text-center mb-6">Crear nuevo empleado</p>

        <Spin spinning={false}>
          <Form
            className="grid gap-2 grid-rows-5 grid-cols-2"
            onFinish={null}
            autoComplete="on"
            form={form}
            //setfieldsvalue={activo === false ? edit() : onReset()}
          >
            <Form.Item
              name="nombre"
              label="Nombre"
              hasFeedback
              rules={[
                {
                  required: true,
                  message: "El nombre es requerido",
                },
              ]}
            >
              <Input placeholder="Nombre" />
            </Form.Item>

            <Form.Item
              name="apellido"
              label="Apellido"
              hasFeedback
              rules={[
                {
                  required: true,
                  message: "El apellido es requerido",
                },
              ]}
            >
              <Input placeholder="Apellido" />
            </Form.Item>

            <Form.Item
              name="identificacion"
              label="Identificación"
              hasFeedback
              rules={[
                {
                  required: true,
                  message: "El identificación es requerido",
                },
                {
                  min: 13,
                  message: "Numero de cédula muy corto",
                },
              ]}
            >
              <Input placeholder="No.cédula" />
            </Form.Item>

            <Form.Item
              name="email"
              label="Email"
              hasFeedback
              rules={[
                {
                  required: true,
                  type: "email",
                  message: "El email es requerido",
                },
              ]}
            >
              <Input type="email" placeholder="Email" />
            </Form.Item>

            <Form.Item
              name="idCargo"
              label="Cargo"
              hasFeedback
              rules={[
                {
                  required: true,
                  message: "El cargo es requerido",
                },
              ]}
            >
              <Select placeholder=" Seleccione el cargo" allowClear>
                <Option value="1">Frontend Development</Option>
              </Select>
            </Form.Item>

            <Form.Item
              name="telefonoResidencial"
              label="Teléfono residencial"
              hasFeedback
            >
              <Input type="number" />
            </Form.Item>
            <Form.Item
              name="celular"
              label="Celular"
              hasFeedback
              rules={[
                {
                  require: true,
                  message: "El celular es requerido",
                },
              ]}
            >
              <Input type="number" />
            </Form.Item>

            <Form.Item
              name="ciudad"
              label="Ciudad"
              hasFeedback
              rules={[
                {
                  required: true,
                  message: "El nombre de la ciudad es requerido",
                },
              ]}
            >
              <Input />
            </Form.Item>

            <Form.Item
              name="calle"
              label="Calle"
              hasFeedback
              rules={[
                {
                  required: true,
                  message: "El nombre de la calle es requerido",
                },
              ]}
            >
              <Input />
            </Form.Item>

            <Form.Item
              name="sector"
              label="Sector"
              hasFeedback
              rules={[
                {
                  required: true,
                  message: "El nombre del sector es requerido",
                },
              ]}
            >
              <Input />
            </Form.Item>
          </Form>
        </Spin>
      </Modal>
    </div>
  );
}

export default ModalFormEmployee;
