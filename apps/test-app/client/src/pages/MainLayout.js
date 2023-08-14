function Header({ style }) {
    return (
        <header style={style}>
            <nav>
                <ul>
                    <li><a href="/">Home</a></li>
                    <li><a href="/about-us">About Us</a></li>
                </ul>
            </nav>
        </header>
    )
}

function Footer({ style }) {
    return (
        <footer style={style}>
            <p>Footer</p>
        </footer>
    )
}

const MainLayout = ({ children }) => {

    const layoutStyle = {
        width: "96%",
        margin: "0 auto",
        backgroundColor: "#eee"
    }

    const headerStyle = {
        width: "100%",
        height: "60px",
    }

    const footerStyle = {
        clear: "both",
        width: "100%",
        backgroundColor: "#ccc",
    }

    return (
        <div style={layoutStyle}>
            <Header style={headerStyle}>그리드</Header>
            <aside>aside</aside>
            <section>section</section>
            <Footer>footer</Footer>
        </div>
    );
}