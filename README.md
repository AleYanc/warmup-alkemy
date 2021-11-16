# WARM-UP ALKEMY
## Tests :
### Todos los tests de los controladores se encuentran en la carpeta */tests/controllers*

## Rutas:
### Usuarios
GET /api/v1/users (**devuelve todos los usuarios**) <br/><br/>
GET /api/v1/users/:id (**devuelve un usuario en específico**) <br/><br/>
PATCH /api/v1/users/:id, params => {email: "email", password: "password"} ( **actualiza usuario dado con los params nuevos** ) <br/><br/>
DELETE /api/v1/users/:id (**elimina el usuario dado**) <br/><br/>
### Auth
POST /api/v1/auth/login, params => {email: "email", password: "password"} ( **devuelve un token que será utilizado para autenticarse y autorizar el uso de rutas** ) <br/><br/>
POST /api/v1/auth/sign_up, params => {email: "email", password: "password"} (**crea un nuevo usuario**)
### Posts
**GET** /api/v1/posts (**devuelve todos los posts**) scopes disponibles: **?by_title=TITULO** / **?by_category=CATEGORIA** / **?limit=LIMITE** / **?offset=OFFSET**<br/><br/>
**GET** /api/v1/posts/:id (**devuelve un post en específico**) <br/><br/>
**POST** /api/v1/posts/, params => {title: "title", content: "content", img: "image", category: "category", user_id: user_id} (**crea un nuevo post con los params dados, siempre especificando un integer que sea el ID de usuario a asociar**)<br/><br/>
**PATCH** /api/v1/posts/:id, params => {title: "title", content: "content", img: "image", category: "category", user_id: user_id} (**actualiza un post con los params nuevos**)<br/><br/>
**DELETE** /api/v1/posts/:id (**elimina un post usando soft delete**)<br/><br/>
**GET** /api/v1/retrieve (**esta ruta nos devuelve todos los posts eliminados con el soft delete en caso de querer recuperar alguno**)<br/><br/>
**POST** /api/v1/recover/:id (**dado un ID de uno de los posts eliminados (extraido de la ruta de recover) podemos recuperar un post y devolverlo a la base de datos**)




 
