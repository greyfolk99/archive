import { createSlice } from "@reduxjs/toolkit";
import DataService from "../services/DataService";

const initialState = {
    loading: false,
    data: {
        name: 'Anon',
        age: 0,
    }
}

const dataSlice = createSlice({
    name: 'data',
    initialState,
    reducers: {
        updateProfile: (state, action) => {
            state.data.name = action.payload.name;
            state.data.age = action.payload.age;
        }
    },
    extraReducers: (builder) => {
        builder.addCase(DataService.fetch.pending, (state, action) => {
            state.loading = true;
        })
        builder.addCase(DataService.fetch.fulfilled, (state, action) => {
            state.loading = false;
            state.data = action.payload;
        })
        builder.addCase(DataService.fetch.rejected, (state, action) => {
            state.loading = false;
        })
    }
})