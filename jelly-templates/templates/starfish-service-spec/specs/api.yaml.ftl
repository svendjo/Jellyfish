swagger: '2.0'
x-package: ${package}
info:
  title: Echo Service API
  description: A description of the Echo Service API
  version: '1.0.0'

host: 127.0.0.1

schemes:
  - http
  - https

basePath: /v1

produces:
  - application/json

paths:
  /echoecho:
    get:
      summary: Echo API
      description: Echo the received message back verbatim
      tags: ['echo']
      operationId: echoGet
      parameters:
        - name: MessageRequest
          required: true
          in: body
          schema:
            $ref: '#/definitions/EchoRequest'
      responses:
        200:
          description: Response
          schema:
            $ref: '#/definitions/EchoResponse'
        default:
          description: Unexpected error
          schema:
            $ref: '#/definitions/Error'

#############################################################
## DEFINITIONS
#############################################################
definitions:
  EchoRequest:
    type: object
    required:
      - message
    properties:
      message:
        description: A text message
        $ref: '#/definitions/Message'
  EchoResponse:
    type: object
    required:
      - message
    properties:
      message:
        description: A text message
        $ref: '#/definitions/Message'
  Message:
    type: object
    properties:
      message:
        type: string
        description: The original message
  Error:
    type: object
    properties:
      code:
        type: integer
        format: int32
      message:
        type: string
      fields:
        type: string
