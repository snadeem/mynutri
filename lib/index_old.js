// Copyright 2017 Viber Media S.à r.l..
// Licensed under the Apache License, Version 2.0 (the 'License');
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an 'AS IS' BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

'use strict';

const express = require('express');
const bodyParser = require('body-parser');

require('dotenv').config();
const NutritionFetcher = require(__dirname + '/nutrition-fetcher');
const NF = new NutritionFetcher(process.env.USDA_NDB_API_KEY || 'DEMO_KEY');
//const NF = new NutritionFetcher(process.env.USDA_NDB_API_KEY || 'H2ymYWloH5KL144KcXCLv7djAi2o9E3G1wKSPq91');



const restService = express();

restService.use(bodyParser.urlencoded({extended: true}));
restService.use(bodyParser.json());

/**
 * Search for nutrtion facts for a give search term. 
 * @param {String} searchTerm The search term.
 * @returns {Promise} promise
 */
function searchFoodItem(searchTerm) {
    return NF.searchFoods(searchTerm, 1).then(queryResult => {
        if (!queryResult) {
            return Promise.reject("No results found");
        }
console.log('Search Term',searchTerm);
        
console.log('QResult',queryResult[0]);
        
        // Items are returned as a FoodItem instance
        // allowing you to call 'getNutritions' directly on the instance.
        return NF.getNutritions(queryResult[0]).then(nutrition => Promise.resolve({searchTerm: searchTerm, nutritions: nutrition}));
    });
}

/**
 * Submit an answer back to the response instance 
 * @param {Response} res
 * @param {String} answer The textual answer.
 */
function submitAnswer(res, answer) {
    return res.json({
        speech: answer,
        displayText: answer,
        source: 'viber-apiai-webhook-sample'
    });
}

/**
 * Randomize nutrient fact from a food item for sample usage
 * @param {FoodItem} foodItem
 * @param {String} answer Random nutrient fact
 */
function constructRandomNutrientFact(foodItem) {
    let randomNutrient = foodItem.nutritions[Math.floor(Math.random() * foodItem.nutritions.length)];
    return foodItem.searchTerm + " has " + randomNutrient.value + " " + randomNutrient.unit + " " + randomNutrient.name;
}

restService.post('/hook', function (req, res) {

    let bodyReq = req.body.queryResult;
    let bodyRes = res;
    //console.log('Got a new request: ', bodyReq)
console.log('BEGIN');
   console.log('Got a new request: ', req.body);
  //  console.log('Fulfilment msg: ', req.body.queryResult.fulfillmentMessages);
    
    //console.log('Got a new response: ', res);
    

    try {
        if (!bodyReq || !bodyReq.parameters ||  !bodyReq.parameters.product || bodyReq.parameters.product.length === 0) {
            submitAnswer(res, "Missing search terms.");
        }
        else {
            console.log('Enter Else condition');
            console.log('console product output',bodyReq.parameters.product.map(searchFoodItem));
            Promise.all(bodyReq.parameters.product.map(searchFoodItem))
                .then(results => {

                    let answer = '';
                console.log('here 1',results);
                console.log('res length',results.length);
                // console.log('Printing response',results);
                    for (var index=0; index<results.length; index++) {
                        answer +=  constructRandomNutrientFact(results[index]);
                                console.log('her  2');
                        // Concat separator only if needed
                        if (index < results.length - 1) {
                            answer +=  "; ";
                        }
                    }
                    console.log('calling answer ', answer);
                    submitAnswer(bodyRes, answer);
                })
                .catch(err =>  {
                    console.log(err);
                    submitAnswer(res, "Error while processing the search. Please try again later.");
                });
        }
    } catch (err) {
        console.error("Can't process request", err);

        return res.status(400).json({
            status: {
                code: 400,
                errorType: err.message
            }
        });
    }
});

var service_port = process.env.PORT || 5000;

var listener = restService.listen(service_port, function() {
    console.log('Listening on port2 ' + listener.address().port);
});
