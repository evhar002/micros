<style>
    ul {
        list-style-type: none;
        margin: 0;
        padding: 0;
        overflow: hidden;
        border: 1px solid #e7e7e7;
        background-color: #f3f3f3;
        position: fixed;
        top: 0;
        width: 100%;
    }

    li {
        float: left;
    }

    li a {
        display: block;
        color: #666;
        text-align: center;
        padding: 14px 16px;
        text-decoration: none;
    }

    li a {
        text-decoration: none;
    }

    li a:hover:not(.active) {
        background-color: #ddd;
    }

    li a.active {
        color: white;
        background-color: #4CAF50;
    }
</style>
<nav>
    <ul class="sidenav">
        <li><a href="/tracker/">Ticker</a></li>
        <li><a href="/blockfolio/">Balance Summary</a></li>
        <li><a href="/blockfolio/balance/">Balance</a></li>
    </ul>
</nav>