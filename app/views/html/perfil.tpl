<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Oficina</title>
    <link rel="stylesheet" href="../../static/css/perfil.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/css/bootstrap.min.css" integrity="sha384-rbsA6ez33eEJ6RCXnYj0QO3/TfM/6b1B2hbJwD4nXzochzU1EyHXkSfj/z4cPzxL" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.3/font/bootstrap-icons.min.css">

</head>
<body>

    <div id="div_nav">

        % if message:
            <div id="msg" class="message">{{message}}</div>
        % end

        <nav id="navbar">
            <div id="div_logo">
                
                <a href="/{{current_user}}">
                    <img id="logo" src="../../static/img/MyStuffs icon.png" alt="Logo">
                    <img id="loguin" src="../../static/img/Package.png" alt="Loguin">
                </a>
            </div>

            <div id="div_itens">
                <ul>
                    <li>
                        <a href="/{{current_user}}">
                            <i class="bi bi-house-fill"></i>
                            <h2 class="tags"> Home </h2>
                        </a>
                    </li>
                    <li>
                        <a href="/oficina/{{current_user}}">
                            <i class="bi bi-pen-fill"></i>
                            <h2 class="tags"> Oficina </h2>
                        </a>
                    </li>
                    <li>
                        <a href="/configuracoes/{{current_user}}">
                            <i class="bi bi-gear-fill"></i>
                            <h2 class="tags"> Configurações </h2>
                        </a>
                    </li>
                    % if current_user == 'admin':
                    <li>
                        <a href="/administracao">
                            <i class="bi bi-table"></i>
                            <h2 class="tags"> Administração </h2>
                        </a>
                    </li>
                    % end
                </ul>
            </div>                
        </nav>
    </div>

        <main>
            <div id="navbar_perfil">

                <div id="text_content">
                    <h1> Olá </h1>
                    <h1 id="username"> {{current_user}} </h1>
                </div>

                <hr>

                <div id="div_space">
                    <ul>
                        <li onclick="switchSection('profile', 'Editar perfil')"><i class="bi bi-person-fill"></i> Editar perfil</li>
                        <li onclick="switchSection('password', 'Alterar senha')"><i class="bi bi-shield-shaded"></i> Alterar Senha</li>
                    </ul>
    
                    <button id="delete"> Deletar conta <i class="bi bi-person-dash"></i> </button>   
                </div>

                <div id="fundoblur"></div>
                
                <div class="spaceModal">
                    <div id="modal_deleteUser">
                        <h2> Tem certeza que deseja deletar sua conta?</h2>
    
                        <div class="deladin , div_btn">
                            <button id="cancelar"> Cancelar </button>
                        <form action="/deleteUser" method="post">
                            <button type="submit"> Deletar </button>
                        </form>
                        </div>
                    </div>
                </div>




                </div>
                
                <header>
                    <div id="div_namepage">
                        <h1 class="namepage"> Editar perfil </h1>
                        <form action="/logout" method="post">
                            <button id="logout" type="submit"> Sair <i class="bi bi-box-arrow-left"></i></button>
                        </form>
                    </div>
                
                    <div id="profile">
                        <div id="edit_perfil">
                            <h2 class="tagPerfil">Avatar</h2>
                            <div id="div_perfil">
                                    <div><img src="../../static/img/userphoto.png" alt="user_photo"></div>
                            </div>
                            <hr>
                            <section>
                                <div class="alterar_dados">
                                    <form action="/editperfil" method="post">
                                        <div class="deladin">
                                            <div class="depe">
                                                <label for="nome">Nome pessoal</label>

                                                % if nome_pessoal:
                                                    <input type="text" name="nome" id="nome" class="input" value="{{nome_pessoal}}">
                                                % else:
                                                    <input type="text" name="nome" id="nome" class="input">
                                                % end

                                            </div>
                                            <div class="depe">
                                                <label for="email">E-mail</label>

                                                % if email:
                                                    <input type="email" name="email" id="email" class="input" value="{{email}}">
                                                % else:
                                                    <input type="email" name="email" id="email" class="input">
                                                % end

                                            </div>
                                        </div>
                                        <div class="depe">
                                            <label for="location">Localização</label>

                                                % if location:
                                                    <input type="text" name="location" id="location" class="input" value="{{location}}">
                                                % else:                                          
                                                    <input type="text" name="location" id="location" class="input">
                                                % end
                                        </div>
                                        <div class="depe">
                                            <label for="bio">Descrição</label>
                                            
                                                % if bio:
                                                    <textarea name="bio" rows="7.5em" id="bio" class="input">{{bio}}</textarea>
                                                % else:
                                                    <textarea name="bio" rows="7.5em" id="bio" class="input"></textarea>
                                                % end

                                            </div>
                                        <button class="btn" type="submit">Salvar alterações</button>
                                    </form>
                                    
                                </div>
                            </section>
                        </div>
                    </div>
                
                    <div id="password" style="display: none;">
                        <section>
                            <div id="edit_password">
                                <div class="alterar_dados">
                                    <form action="/alterarSenha" method="post">
                                        <div class="depe">
                                            <label for="oldpassword"> Insira sua senha antiga </label>
                                            <input type="password" name="oldpassword" id="oldpassword" class="input">
                                            <label for="newpassword"> Insira sua senha nova </label>
                                            <input type="password" name="newpassword" id="newpassword" class="input">
                                            <label for="confirm"> Confirme sua senha </label>
                                            <input type="password" name="confirm" id="confirm" class="input">
                                            <span id="spanAlert"></span>
                                        </div>
                                        <button class="btn" id="alterar" type="submit" disabled="true"> Alterar senha </button>
                                    </form>
                                </div>
                            </div>
                        </section>
                    </div>
                </header>
        </main>

        <!-- Scripts do Bootstrap -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.11.6/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/js/bootstrap.min.js"></script>
        <script src="../../static/js/perfil.js"></script>
    </body>
    </html>
    