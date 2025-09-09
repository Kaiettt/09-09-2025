<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <html lang="vi">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Product List</title>
            <style>
                body {
                    font-family: Arial, sans-serif;
                    margin: 30px;
                    background-color: #f4f4f4;
                }

                h1 {
                    color: #333;
                }

                table {
                    width: 80%;
                    border-collapse: collapse;
                    margin-top: 20px;
                    background-color: #fff;
                }

                th,
                td {
                    padding: 12px;
                    text-align: left;
                }

                th {
                    background-color: #007BFF;
                    color: white;
                }

                tr:nth-child(even) {
                    background-color: #f2f2f2;
                }

                button {
                    background-color: #28a745;
                    color: white;
                    border: none;
                    padding: 8px 12px;
                    cursor: pointer;
                    border-radius: 4px;
                }

                button:hover {
                    background-color: #218838;
                }

                .success-msg {
                    background-color: #d4edda;
                    color: #155724;
                    padding: 10px 15px;
                    border-radius: 4px;
                    margin-bottom: 15px;
                    display: inline-block;
                }
            </style>
        </head>

        <body>
            <h1>Item Listing</h1>

            <!-- Thông báo thêm sản phẩm thành công -->
            <c:if test="${not empty successMessage}">
                <div class="success-msg">${successMessage}</div>
            </c:if>

            <table border="1" cellpadding="10" cellspacing="0">
                <thead>
                    <tr>
                        <th>Description</th>
                        <th>Price</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="product" items="${products}">
                        <tr>
                            <td>${product.name}</td>
                            <td>$${product.price}</td>
                            <td>
                                <form action="cart" method="post">
                                    <input type="hidden" name="productId" value="${product.id}">
                                    <input type="hidden" name="productName" value="${product.name}">
                                    <input type="hidden" name="productPrice" value="${product.price}">
                                    <button type="submit">Add to Cart</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </body>

        </html>