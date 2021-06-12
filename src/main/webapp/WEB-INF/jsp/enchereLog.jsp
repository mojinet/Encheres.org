<%@ page import="org.enchere.bo.Categorie" %>
<%@ page import="java.util.List" %>
<%@ page import="org.enchere.servlet.test.ServletTestLoane" %>
<%@ page import="org.enchere.bo.Utilisateur" %>
<%@ page import="org.enchere.bo.Articles" %>
<%@ page import="org.enchere.bll.UtilisateurManager" %>
<%@ page import="org.enchere.bll.ArticleManager" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<jsp:include page="fragment/head.jsp">
    <jsp:param name="title" value="Encheres.org"/>
</jsp:include>
<head>
    <title>Liste des enchères</title>
</head>
<body>

<%@include file="fragment/navbar.jsp"%>
    <h1 class="text-center my-5">Liste des enchères</h1>



    <form action="<%=request.getContextPath()%>/ServletHome" method="post">
        <div class="saisie search-bar">
            <input class="form-control me-2 input-search" type="search" id="recherche-article" name="recherche"
                   placeholder="Rechercher sur ENI Encheres"
                   aria-label="Rechercher l'article">
            <div class="filtre">
                <select  class="form-select form-select-lg mb-3" name="categories" id="categories">
                    <option selected value="all">Toutes les catégories</option>
                    <c:forEach var="c" items="${categories}">
                        <option value="">${c.getLibelle()}</option>
                    </c:forEach>
                </select>
            </div>
        </div>




        <div>
            <div class="text-center mb-3">
                <input type="radio" name="choix" id="achats" checked value="achat">
                <label class="mr-2" for="achats">Achats</label>
                <input type="checkbox" id="ouverte" name="enchereOuverte" checked>
                <label class="mr-2" for="ouverte">enchères ouvertes</label>
                <input type="checkbox" id="encours" name="mesEncheres">
                <label class="mr-2" for="encours">mes enchères</label>
                <input type="checkbox" id="remportees" name="enchereRemportee">
                <label class="mr-2" for="remportees">mes enchères remportées</label>
            </div>
            <div class="text-center">
                <input type="radio" name="choix" id="ventes" value="vente">
                <label class="mr-2" for="ventes">Mes ventes</label>
                <input type="checkbox" id="venteEncours" name="venteEncours">
                <label class="mr-2" for="venteEncours">mes ventes en cours</label>
                <input type="checkbox" id="nonDebute" name="nonDebute">
                <label class="mr-2" for="nonDebute">ventes non débutées</label>
                <input type="checkbox" id="terminees" name="terminees">
                <label class="mr-2" for="terminees">ventes terminées</label>
            </div>
            <button  class="btn btn-outline-success text-center mx-auto mt-2 d-block" type="submit">Valider</button>
        </div>


    </form>
    <section class="enchere-section">

        <c:forEach var="articles" items="${articles}">
            <div class="card article-box" >
                <img class="card-img-top" src="${pageContext.request.contextPath}/images/groot.png" alt="Card image cap">
                <div class="card-body">
                    <h4 class="card-title" >Article : ${articles.getNomArticles()}</h4>
                    <p class="card-text">Description : ${articles.getDescription()}</p>
                    <p class="card-text">Prix : ${articles.getMiseAprix()}</p>
                    <p class="card-text">Vendeur : ${articles.getUtilisateur().getpseudo()}</p>

                </div>
                <div class="card-footer">
                    <a href="#" class="btn btn-primary">Détail article</a>
                </div>
            </div>

        </c:forEach>

    </section>

<%@include file="fragment/footer.jsp"%>




</body>
</html>