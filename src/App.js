import { AnimatePresence } from "framer-motion";
import { lazy, Suspense } from "react";
import { BrowserRouter as Router, Route, Routes } from "react-router-dom";
import ScrollToTop from "./components/ScrollToTop";
import AppFooter from "./components/shared/AppFooter";
import AppHeader from "./components/shared/AppHeader";
import "./css/App.css";
import UseScrollToTop from "./hooks/useScrollToTop";

import svg01 from "./images/svgteam/svg01.svg";
import svg02 from "./images/svgteam/svg02.svg";
import svg03 from "./images/svgteam/svg03.svg";
import svg04 from "./images/svgteam/svg04.svg";
import svg05 from "./images/svgteam/svg05.svg";
import svg06 from "./images/svgteam/svg06.svg";
import svg07 from "./images/svgteam/svg07.svg";
import svg08 from "./images/svgteam/svg08.svg";
import svg09 from "./images/svgteam/svg09.svg";
import svg10 from "./images/svgteam/svg10.svg";
import svg11 from "./images/svgteam/svg11.svg";

const About = lazy(() => import("./pages/AboutMe"));
const Contact = lazy(() => import("./pages/Contact.jsx"));
const Home = lazy(() => import("./pages/Home"));
const Projects = lazy(() => import("./pages/Projects"));
const ProjectSingle = lazy(() => import("./pages/ProjectSingle.jsx"));
function App() {
  return (
    <AnimatePresence>
      <div className=" bg-secondary-light dark:bg-primary-dark transition duration-300  sm:mt-0 sm:mr-10 sm:ml-10 justify-center">
        <img src={svg01} alt="Your SVG" />
        <img src={svg02} alt="Your SVG" />
        <img src={svg03} alt="Your SVG" />
        <img src={svg04} alt="Your SVG" />
        <img src={svg05} alt="Your SVG" />
        <img src={svg06} alt="Your SVG" />
        <img src={svg07} alt="Your SVG" />
        <img src={svg08} alt="Your SVG" />
        <img src={svg09} alt="Your SVG" />
        <img src={svg10} alt="Your SVG" />
        <img src={svg11} alt="Your SVG" />
      </div>
    </AnimatePresence>
  );
}

export default App;
