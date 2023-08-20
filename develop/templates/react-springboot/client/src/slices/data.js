import { createSlice } from "@reduxjs/toolkit";
import dataService from "../services/DataService";

const initialState = {
    loading: false,
    data: {
        name: 'Anon',
        age: 0,
        message: 'hi'
    }
}

const dataSlice = createSlice({
    name: 'data',
    initialState,
    reducers: {
        updateProfile: (state, action) => {
            state.data.name = action.payload.name;
            state.data.age = action.payload.age;
        },
    },
    extraReducers: (builder) => {
        builder.addCase(dataService.getHello.pending, (state, action) => {
            state.loading = true;
        })
        builder.addCase(dataService.getHello.fulfilled, (state, action) => {
            state.loading = false;
            state.data.message = action.payload
        })
        builder.addCase(dataService.getHello.rejected, (state, action) => {
            state.loading = false;
        })
    }
})

export default dataSlice.reducer;