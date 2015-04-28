'use strict';

var mongoose = require('mongoose'),
		Schema = mongoose.Schema;

var ExpenseSchema = new Schema({
	name: String,
	info: String,
	active: Boolean,
	type: { type: Number, default: 0 },
	amount: Number
});

module.exports = mongoose.model('Expense', ExpenseSchema);
