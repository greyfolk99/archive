import {configureStore} from "@reduxjs/toolkit";
import dataReducer from "../slices/data";

const reducer = {
    data: dataReducer,
}

const store = configureStore({
    reducer : reducer,
    devTools: process.env.NODE_ENV !== 'production',
})

export default store;