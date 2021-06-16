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
<img src="${pageContext.request.contextPath}/images/shop.png" class="groot">
<h1 class="text-center my-5">Liste des enchères</h1>

<form action="<%=request.getContextPath()%>/Encheres" method="post">
    <div class="saisie search-bar">
        <input class="form-control me-2 input-search" type="search" id="recherche-article" name="recherche"
               placeholder="Rechercher sur ENI Encheres"
               aria-label="Rechercher l'article">
        <div class="filtre">
            <select  class="form-select form-select-lg mb-3" name="categories" id="categories">
                <option selected value="-1">Toutes les catégories</option>
                <c:forEach var="categories" items="${categories}">
                    <option name="sCategorie" value="${categories.noCategorie}">${categories.libelle}</option>
                </c:forEach>
            </select>
        </div>
    </div>
    <div class="checkbox-block"  >
        <button  class="btn btn-outline-success valider-checkbox" type="submit">Valider</button>
    </div>
</form>

<section class="enchere-section">
    <c:forEach var="articles" items="${articles}">
        <div class="card article-box" >
            <h4 class="card-title text-center title-card" > ${articles.getNomArticles()}</h4>
            <img class="card-img-top" src="${pageContext.request.contextPath}/images/groot.png" alt="Card image cap">
            <div class="card-body">
                <p class="card-text">Description : ${articles.getDescription()}</p>
                <p class="card-text">Prix Initial: ${articles.getMiseAprix()}</p>
                <p class="card-text">Enchere actuelle: ${articles.getLastEncheres().getMontant_enchere()}</p>
                <p class="card-text vendeur">Vendeur : ${articles.getUtilisateur().getPseudo()}</p>
            </div>
            <div class="card-footer">
                <a href="<%=request.getContextPath()%>/Connexion" class="btn btn-primary">Connexion</a>
            </div>
        </div>
    </c:forEach>
</section>

<%@include file="fragment/footer.jsp"%>

</body>
</html>