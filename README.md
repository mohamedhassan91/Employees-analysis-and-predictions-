# Employees-analysis-and-predictions-
## ERD Diagram 

![image](https://user-images.githubusercontent.com/60258264/218114460-822e3528-d77a-44e0-8f81-9b87e03d5ca6.png)

### Objective 

***Doing some analysis on sql & python then trying to predict salaries based on the data and finally design a Tableue dashboard to present some insightful***

We used below sql command for the data we want to explore our analysis on python
```
SELECT 
    e.*, s.salary, t.title, d.dept_no
FROM
    employees e
        LEFT JOIN
    salaries s ON e.emp_no = s.emp_no
        JOIN
    titles t ON e.emp_no = t.emp_no
        JOIN
    dept_emp d ON e.emp_no = d.emp_no
where salary is not null    
GROUP BY emp_no
ORDER BY emp_no;
select * from dept_emp;
```
![image](https://user-images.githubusercontent.com/60258264/226901414-d329e8c9-64aa-400f-90fa-b9ed2a2db145.png)


***Every employee with his salary , departments and the avg salary of his departments***
```
select e.emp_no , s.salary , d.dept_name ,
avg(salary) over(partition by dept_name) as avg_sal_dept
from employees e left join salaries s on e.emp_no = s.emp_no
join dept_emp dm on e.emp_no = dm.emp_no
join departments d on d.dept_no = dm.dept_no
where salary is not null
group by emp_no
order by emp_no; 
```

### EDA

***Gender count*** 

![image](https://user-images.githubusercontent.com/60258264/226902082-e41b9a16-0ae5-4a63-9757-8ad7f3447314.png)

***Age distrbution per gender*** 

![image](https://user-images.githubusercontent.com/60258264/226902250-83b4a35a-8b5a-4957-81b3-1e6744f9906d.png)

***distrbution of the titles per gender***

![image](https://user-images.githubusercontent.com/60258264/226902520-9da1007d-0ddc-465d-8c46-a3bb74171d8d.png)

***features correlation***

![image](https://user-images.githubusercontent.com/60258264/226902724-c94726b6-03eb-45cd-b2fe-0a3c4bbef98a.png)

***Using the elbow method to find the optimal number of clusters***

![image](https://user-images.githubusercontent.com/60258264/226903395-d618748b-b726-46f8-a445-fda5af3492f8.png)

### Machine learning 

***linear regression***
```
Test set evaluation:
_____________________________________
MAE: 9043.77987442033
MSE: 129479863.72594881
RMSE: 11378.921905257494
R2 Square 0.37087072142615307
__________________________________
Train set evaluation:
_____________________________________
MAE: 9061.97182702104
MSE: 130491199.02365081
RMSE: 11423.274444030958
R2 Square 0.3644614268204607
```
***SGDRegressor***
```
Test set evaluation:
_____________________________________
MAE: 9075.868153713267
MSE: 129586998.65650111
RMSE: 11383.628536477336
R2 Square 0.37035016386894803
__________________________________
====================================
Train set evaluation:
_____________________________________
MAE: 9094.913048884657
MSE: 130621014.57039382
RMSE: 11428.955095300436
R2 Square 0.36382917891431177
```
***RidgeRegressor***
```
Test set evaluation:
_____________________________________
MAE: 9058.688298444775
MSE: 129500936.96452288
RMSE: 11379.847844524234
R2 Square 0.37076832873743837
__________________________________
====================================
Train set evaluation:
_____________________________________
MAE: 9076.868225964972
MSE: 130528443.9328696
RMSE: 11424.904548085713
R2 Square 0.3642800308593521
```
***LassoRegressor***
```
Test set evaluation:
_____________________________________
MAE: 9044.391452658498
MSE: 129488359.3374601
RMSE: 11379.295203898178
R2 Square 0.370829442127679
__________________________________
====================================
Train set evaluation:
_____________________________________
MAE: 9062.235156216833
MSE: 130495458.64942509
RMSE: 11423.460887551772
R2 Square 0.3644406809271965
```
The R2 score for all models are not good enogh we defintely will need more items more related to the target like the numbers of the experience so the model could learn and give us better result but if we go for these score will go for lasso regressor most dummy features got correlated with the goal and consider less for MAE

### Visulaization on Tableua

![image](https://user-images.githubusercontent.com/60258264/226905639-f5d0a11f-3c5d-42c4-80cb-877722a4a440.png)

***Link of the dashboard***

https://public.tableau.com/app/profile/mohamed.hassan6266/viz/EmployeesDashboard_16785548922490/EmployeesDashboard
