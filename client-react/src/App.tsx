import React from 'react';
import './App.css';
import {  Route, Routes } from 'react-router-dom';
import {Home, MainLayout} from "./layouts/MainLayout";
function App() {
  return (
      <Routes>
        <Route path="/" element={
          <MainLayout>
            <Home />
          </MainLayout>
        } />
      </Routes>
  );
}

export default App;
