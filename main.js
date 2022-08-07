
/**
 * Author: Harshil Patel
 * Specs: Web Scrapes latest COVID-19 info onto a google sheets
 * Date: 21/02/2022
 */

const {google, pagespeedonline_v2} = require('googleapis');
const keys = require('./keys.json');

const client = new google.auth.JWT(
    keys.client_email, 
    null, 
    keys.private_key,
    ['https://www.googleapis.com/auth/spreadsheets']
);

client.authorize(function(err,tokens){
    if(err){
        console.log(err);
        return;
    } else {
        console.log('Connected!');
        gsrun(client);
    }
});

async function gsrun(cl){

    const puppeteer = require('puppeteer');
    const browser = await puppeteer.launch();
    const page = await browser.newPage();
    await page.goto('https://flo.uri.sh/visualisation/7314563/embed?auto=1');

    const [reportDate] = await page.$x('/html/body/div[1]/main/section[4]/div[1]/div/div[1]/div/div[1]/div[1]/div/div[3]/h2');
    const reportDatetxt = await reportDate.getProperty('textContent');
    const reportDateTxt = await reportDatetxt.jsonValue();

    const [communityCases] = await page.$x('/html/body/div[1]/main/section[4]/div[1]/div/div[1]/div/div[1]/div[2]/div/div[2]/h1');
    const communityCasestxt = await communityCases.getProperty('textContent');
    const communityCasesTxt = await communityCasestxt.jsonValue();

    const [borderCases] = await page.$x('/html/body/div[1]/main/section[4]/div[1]/div/div[1]/div/div[1]/div[3]/div/div[2]/h1');
    const borderCasestxt = await borderCases.getProperty('textContent');
    const borderCasesTxt = await borderCasestxt.jsonValue();

    const [activeCases] = await page.$x('/html/body/div[1]/main/section[4]/div[1]/div/div[1]/div/div[1]/div[4]/div/div[2]/h1');
    const activeCasestxt = await activeCases.getProperty('textContent');
    const activeCasesTxt = await activeCasestxt.jsonValue();

    const [hospitalCases] = await page.$x('/html/body/div[1]/main/section[4]/div[1]/div/div[1]/div/div[1]/div[5]/div/div[2]/h1');
    const hospitalCasestxt = await hospitalCases.getProperty('textContent');
    const hospitalCasesTxt = await hospitalCasestxt.jsonValue();

    const [ICUCases] = await page.$x('/html/body/div[1]/main/section[4]/div[1]/div/div[1]/div/div[1]/div[6]/div/div[2]/h1');
    const ICUCasestxt = await ICUCases.getProperty('textContent');
    const ICUCasesTxt = await ICUCasestxt.jsonValue();

    const [totalDeaths] = await page.$x('/html/body/div[1]/main/section[4]/div[1]/div/div[1]/div/div[1]/div[8]/div/div[2]/h1');
    const totalDeathstxt = await totalDeaths.getProperty('textContent');
    const totalDeathsTxt = await totalDeathstxt.jsonValue();

    const [totaldoubleDose] = await page.$x('/html/body/div[1]/main/section[4]/div[1]/div/div[1]/div/div[1]/div[11]/div/div[2]/h1');
    const totaldoubleDosetxt = await totaldoubleDose.getProperty('textContent');
    const totaldoubleDoseTxt = await totaldoubleDosetxt.jsonValue();

    const [totalBooster] = await page.$x('/html/body/div[1]/main/section[4]/div[1]/div/div[1]/div/div[1]/div[12]/div/div[2]/h1');
    const totalBoostertxt = await totalBooster.getProperty('textContent');
    const totalBoosterTxt = await totalBoostertxt.jsonValue();

    const browser2 = await puppeteer.launch();
    const page2 = await browser2.newPage();
    await page2.goto('https://www.health.govt.nz/our-work/diseases-and-conditions/covid-19-novel-coronavirus/covid-19-data-and-statistics/testing-covid-19');
    
    const [dailyTests] = await page2.$x('/html/body/div[2]/div/div[1]/section/div[2]/section/div/div/div[2]/div[2]/div/article/div[2]/div/div/div[2]/table/tbody/tr[5]/td[1]');
    const dailyTeststxt = await dailyTests.getProperty('textContent');
    const dailyTestsTxt = await dailyTeststxt.jsonValue();

    const browser3 = await puppeteer.launch();
    const page3 = await browser3.newPage();
    await page3.goto('https://www.health.govt.nz/our-work/diseases-and-conditions/covid-19-novel-coronavirus/covid-19-data-and-statistics/covid-19-current-cases');
    
    const [selfIsolation] = await page3.$x('/html/body/div[2]/div/div[1]/section/div[2]/section/div/div/div[2]/div[2]/div/article/div[2]/div/div/div[5]/table/tbody/tr[1]/td[2]');
    const selfIsolationtxt = await selfIsolation.getProperty('textContent');
    const selfIsolationTxt = await selfIsolationtxt.jsonValue();

    const [managedIsolation] = await page3.$x('/html/body/div[2]/div/div[1]/section/div[2]/section/div/div/div[2]/div[2]/div/article/div[2]/div/div/div[5]/table/tbody/tr[3]/td[2]');
    const managedIsolationtxt = await managedIsolation.getProperty('textContent');
    const managedIsolationTxt = await managedIsolationtxt.jsonValue();

    const browser4 = await puppeteer.launch();
    const page4 = await browser4.newPage();
    await page4.goto('https://www.health.govt.nz/our-work/diseases-and-conditions/covid-19-novel-coronavirus/covid-19-data-and-statistics/covid-19-case-demographics');
    
    const [maoriActiveTotal] = await page4.$x('/html/body/div[2]/div/div[1]/section/div[2]/section/div/div/div[2]/div[2]/div/article/div[2]/div/div/div[7]/table/tbody/tr[1]/td[1]');
    const maoriActiveTotaltxt = await maoriActiveTotal.getProperty('textContent');
    const maoriActiveTotalTxt = await maoriActiveTotaltxt.jsonValue();

    const [pacificActiveTotal] = await page4.$x('/html/body/div[2]/div/div[1]/section/div[2]/section/div/div/div[2]/div[2]/div/article/div[2]/div/div/div[7]/table/tbody/tr[2]/td[1]');
    const pacificActiveTotaltxt = await pacificActiveTotal.getProperty('textContent');
    const pacificActiveTotalTxt = await pacificActiveTotaltxt.jsonValue();

    const [asianActiveTotal] = await page4.$x('/html/body/div[2]/div/div[1]/section/div[2]/section/div/div/div[2]/div[2]/div/article/div[2]/div/div/div[7]/table/tbody/tr[3]/td[1]');
    const asianActiveTotaltxt = await asianActiveTotal.getProperty('textContent');
    const asianActiveTotalTxt = await asianActiveTotaltxt.jsonValue();

    const [MELAAActiveTotal] = await page4.$x('/html/body/div[2]/div/div[1]/section/div[2]/section/div/div/div[2]/div[2]/div/article/div[2]/div/div/div[7]/table/tbody/tr[4]/td[1]');
    const MELAAActiveTotaltxt = await MELAAActiveTotal.getProperty('textContent');
    const MELAAActiveTotalTxt = await MELAAActiveTotaltxt.jsonValue();

    const [europeanActiveTotal] = await page4.$x('/html/body/div[2]/div/div[1]/section/div[2]/section/div/div/div[2]/div[2]/div/article/div[2]/div/div/div[7]/table/tbody/tr[5]/td[1]');
    const europeanActiveTotaltxt = await europeanActiveTotal.getProperty('textContent');
    const europeanActiveTotalTxt = await europeanActiveTotaltxt.jsonValue();

    const [unknownActiveTotal] = await page4.$x('/html/body/div[2]/div/div[1]/section/div[2]/section/div/div/div[2]/div[2]/div/article/div[2]/div/div/div[7]/table/tbody/tr[6]/td[1]');
    const unknownActiveTotaltxt = await unknownActiveTotal.getProperty('textContent');
    const unknownActiveTotalTxt = await unknownActiveTotaltxt.jsonValue();
    // Total
    const [maoriTotal] = await page4.$x('/html/body/div[2]/div/div[1]/section/div[2]/section/div/div/div[2]/div[2]/div/article/div[2]/div/div/div[4]/table/tbody/tr[1]/td[1]');
    const maoriTotaltxt = await maoriTotal.getProperty('textContent');
    const maoriTotalTxt = await maoriTotaltxt.jsonValue();

    const [pacificTotal] = await page4.$x('/html/body/div[2]/div/div[1]/section/div[2]/section/div/div/div[2]/div[2]/div/article/div[2]/div/div/div[4]/table/tbody/tr[2]/td[1]');
    const pacificTotaltxt = await pacificTotal.getProperty('textContent');
    const pacificTotalTxt = await pacificTotaltxt.jsonValue();

    const [asianTotal] = await page4.$x('/html/body/div[2]/div/div[1]/section/div[2]/section/div/div/div[2]/div[2]/div/article/div[2]/div/div/div[4]/table/tbody/tr[3]/td[1]');
    const asianTotaltxt = await asianTotal.getProperty('textContent');
    const asianTotalTxt = await asianTotaltxt.jsonValue();

    const [MELAATotal] = await page4.$x('/html/body/div[2]/div/div[1]/section/div[2]/section/div/div/div[2]/div[2]/div/article/div[2]/div/div/div[4]/table/tbody/tr[4]/td[1]');
    const MELAATotaltxt = await MELAATotal.getProperty('textContent');
    const MELAATotalTxt = await MELAATotaltxt.jsonValue();

    const [europeanTotal] = await page4.$x('/html/body/div[2]/div/div[1]/section/div[2]/section/div/div/div[2]/div[2]/div/article/div[2]/div/div/div[4]/table/tbody/tr[5]/td[1]');
    const europeanTotaltxt = await europeanTotal.getProperty('textContent');
    const europeanTotalTxt = await europeanTotaltxt.jsonValue();

    const [unknownTotal] = await page4.$x('/html/body/div[2]/div/div[1]/section/div[2]/section/div/div/div[2]/div[2]/div/article/div[2]/div/div/div[4]/table/tbody/tr[6]/td[1]');
    const unknownTotaltxt = await unknownTotal.getProperty('textContent');
    const unknownTotalTxt = await unknownTotaltxt.jsonValue();
    // Hospital
    const [maoriHospitalTotal] = await page4.$x('/html/body/div[2]/div/div[1]/section/div[2]/section/div/div/div[2]/div[2]/div/article/div[2]/div/div/div[4]/table/tbody/tr[1]/td[3]');
    const maoriHospitalTotaltxt = await maoriHospitalTotal.getProperty('textContent');
    const maoriHospitalTotalTxt = await maoriHospitalTotaltxt.jsonValue();

    const [pacificHospitalTotal] = await page4.$x('/html/body/div[2]/div/div[1]/section/div[2]/section/div/div/div[2]/div[2]/div/article/div[2]/div/div/div[4]/table/tbody/tr[2]/td[3]');
    const pacificHospitalTotaltxt = await pacificHospitalTotal.getProperty('textContent');
    const pacificHospitalTotalTxt = await pacificHospitalTotaltxt.jsonValue();

    const [asianHospitalTotal] = await page4.$x('/html/body/div[2]/div/div[1]/section/div[2]/section/div/div/div[2]/div[2]/div/article/div[2]/div/div/div[4]/table/tbody/tr[3]/td[3]');
    const asianHospitalTotaltxt = await asianHospitalTotal.getProperty('textContent');
    const asianHospitalTotalTxt = await asianHospitalTotaltxt.jsonValue();

    const [MELAAHospitalTotal] = await page4.$x('/html/body/div[2]/div/div[1]/section/div[2]/section/div/div/div[2]/div[2]/div/article/div[2]/div/div/div[4]/table/tbody/tr[4]/td[3]');
    const MELAAHospitalTotaltxt = await MELAAHospitalTotal.getProperty('textContent');
    const MELAAHospitalTotalTxt = await MELAAHospitalTotaltxt.jsonValue();

    const [europeanHospitalTotal] = await page4.$x('/html/body/div[2]/div/div[1]/section/div[2]/section/div/div/div[2]/div[2]/div/article/div[2]/div/div/div[4]/table/tbody/tr[5]/td[3]');
    const europeanHospitalTotaltxt = await europeanHospitalTotal.getProperty('textContent');
    const europeanHospitalTotalTxt = await europeanHospitalTotaltxt.jsonValue();

    const [unknownHospitalTotal] = await page4.$x('/html/body/div[2]/div/div[1]/section/div[2]/section/div/div/div[2]/div[2]/div/article/div[2]/div/div/div[4]/table/tbody/tr[6]/td[3]');
    const unknownHospitalTotaltxt = await unknownHospitalTotal.getProperty('textContent');
    const unknownHospitalTotalTxt = await unknownHospitalTotaltxt.jsonValue();

    browser.close();
    browser2.close();
    browser3.close();
    browser4.close();

    const gsapi = google.sheets({version:'v4', auth: cl })
 
    // let data = await gsapi.spreadsheets.values.get(opt);
    // let dataArray = data.data.values;
    let dataArray = [[reportDateTxt], 
                    [communityCasesTxt],
                    [borderCasesTxt],
                    [activeCasesTxt],
                    [hospitalCasesTxt],
                    [ICUCasesTxt],
                    [totalDeathsTxt],
                    [totaldoubleDoseTxt],
                    [totalBoosterTxt]]

    let ethnicityArray = [[maoriActiveTotalTxt, maoriTotalTxt, maoriHospitalTotalTxt],
                        [pacificActiveTotalTxt, pacificTotalTxt, pacificHospitalTotalTxt],
                        [asianActiveTotalTxt, asianTotalTxt, asianHospitalTotalTxt],
                        [MELAAActiveTotalTxt, MELAAActiveTotalTxt, MELAAHospitalTotalTxt],
                        [europeanActiveTotalTxt, europeanTotalTxt, europeanHospitalTotalTxt],
                        [unknownActiveTotalTxt, unknownTotalTxt, unknownHospitalTotalTxt]]

    const updateOptions = {
        spreadsheetId: '1kLT_bCo1MoknF1O_XzekIjHimQDQF38b3gQ9NDlWuys',
        range: 'A1:A11',
        valueInputOption: 'USER_ENTERED',
        resource: {values: dataArray}
    };

    let date_ob = new Date();

    let date = ("0" + date_ob.getDate()).slice(-2);
    let month = ("0" + (date_ob.getMonth() + 1)).slice(-2);
    let year = date_ob.getFullYear();
    let full_date = month.concat('/').concat(date).concat('/').concat(year)
    let full_date2 = date.concat('/').concat(month).concat('/').concat(year)

    let dateCommunityCases = [[full_date, communityCasesTxt]];
    let dailyTestsArray = [[full_date, dailyTestsTxt]];

    const opt = {
        spreadsheetId: '1K1TE8zEWnvXlxF_bPIvZZnQSpc4JmP2qry8FaMeXevo',
        range: 'A:B'
    };

    const opt2 = {
        spreadsheetId: '1_4bNQNDwBzjuUzmvvVEEHMGXOR8TFDzYeoFa0jYpFLk',
        range: 'A:B'
    };

    let data2 = await gsapi.spreadsheets.values.get(opt2);
    let commArray2 = data2.data.values;
    let newCommArray2 = commArray2.map(function(r){
        return r;
    });
    let input_entry2 = newCommArray2.length + 1;
    let range_string2 = 'A'.concat(input_entry2).concat(':').concat('C').concat(input_entry2);


    let dailyLocation = [[full_date, 0, 0]];


    let data = await gsapi.spreadsheets.values.get(opt);
    let commArray = data.data.values;
    let newCommArray = commArray.map(function(r){
        return r;
    });
    let input_entry = newCommArray.length + 1;
    let range_string = 'A'.concat(input_entry).concat(':').concat('B').concat(input_entry);

    let borderCasesArray = [[full_date2, borderCasesTxt]];
  
    const updateOptions2 = {
        spreadsheetId: '1K1TE8zEWnvXlxF_bPIvZZnQSpc4JmP2qry8FaMeXevo',
        range: range_string,
        valueInputOption: 'USER_ENTERED',
        resource: {values: dateCommunityCases}
    };

    const updateOptions3 = {
        spreadsheetId: '14qOxvMAN0mk2ffWmNu7eW1A0j2OcsV5JoPiSt29p16w',
        range: range_string,
        valueInputOption: 'USER_ENTERED',
        resource: {values: dailyTestsArray}
    };


    const updateOptions4 = {
        spreadsheetId: '1_4bNQNDwBzjuUzmvvVEEHMGXOR8TFDzYeoFa0jYpFLk',
        range: range_string2,
        valueInputOption: 'USER_ENTERED',
        resource: {values: dailyLocation}
    };

    const updateOptions5 = {
        spreadsheetId: '1qs4a4laPQ6-m4zLcrcmPYX8NIKgdJp72OR_aOldbMxk',
        range: range_string,
        valueInputOption: 'USER_ENTERED',
        resource: {values: borderCasesArray}
    };

    const updateOptions6 = {
        spreadsheetId: '1VK7ByhCsZmVzkb28AABTPvnOtOAfk9i3NVRN8TsrYtQ',
        range: 'B2:D7',
        valueInputOption: 'USER_ENTERED',
        resource: {values: ethnicityArray}
    };

    console.log(ethnicityArray);
    let res = await gsapi.spreadsheets.values.update(updateOptions);
    let res2 = await gsapi.spreadsheets.values.update(updateOptions2);
    let res3 = await gsapi.spreadsheets.values.update(updateOptions3);
    let res4 = await gsapi.spreadsheets.values.update(updateOptions4);
    let res5 = await gsapi.spreadsheets.values.update(updateOptions5);
    let res6 = await gsapi.spreadsheets.values.update(updateOptions6);
    console.log(full_date);

}
