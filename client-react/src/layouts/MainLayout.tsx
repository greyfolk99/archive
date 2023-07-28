import React from "react";

interface MainLayoutProps {
    children?:
        React.ReactNode
        | React.ReactNode[]
        | any
        | any[];
}

export function MainLayout({ children }: MainLayoutProps) {
  return (
    <div className="main-layout">
      <div>
        <Navbar />
      </div>
      <div className="main-layout__content">
        {children}
      </div>
      <div>
        <Footer />
      </div>
    </div>
  );
}

export function Navbar () {
    return (
        <div className="header">
            <div className="header__logo">
            </div>
            <div className="header__menu">
            </div>
        </div>
    );
}

export function Footer () {
    return (
    <footer className="footer">
      <div className="footer__content">
        <p>
            COPYRIGHT © 2023
        </p>
      </div>
    </footer>
    )
}
export function Home () {
    return (
        <div className="home">
            <h1>Home</h1>
        </div>
    );
}