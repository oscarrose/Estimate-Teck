import React, { useState } from "react";
import { Modal, Form, Input, Select, Spin } from "antd";

const { Option } = Select;
function ModalFormEmployee() {
  const [form] = Form.useForm();
  const onReset = () => {
    form.resetFields();
  };

  return (
    <div>
      <Modal centered open={false} footer={null} onCancel={() => {}}>
        <h2>Crear nuevo empleado</h2>

        <Spin spinning={false}>
          <Form
            onFinish={null}
            autoComplete="on"
            form={form}
            //setfieldsvalue={activo === false ? edit() : onReset()}
          >
            {/* <h6 className="lbcampo"></h6> */}
            <Form.Item
              name="nombre"
              label="Nombre"
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
              rules={[
                {
                  required: true,
                    type: 'email',
                  message: "El email es requerido",
                },
              
              ]}
            >
              <Input type='email' placeholder="Email" />
            </Form.Item>

           
            <Form.Item
              name="idCargo"
              rules={[
                {
                  required: true,
                  message: "El cargo es necesario",
                },
              ]}
            >
              <Select placeholder=" Seleccione el tipo de cargo" allowClear>
              
              </Select>
            </Form.Item>

            <Form.Item
              wrapperCol={{
                offset: 8,
                span: 16,
              }}
            >
              <button type="submit">Confirmar</button>
            </Form.Item>
          </Form>
        </Spin>
      </Modal>
    </div>
  );
}

export default ModalFormEmployee;
