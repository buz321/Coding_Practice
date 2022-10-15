## Write an SQL query to report the type of each node in the tree.

Return the result table ordered by id in ascending order.

Each node in the tree can be one of three types:

"Leaf": if the node is a leaf node.
"Root": if the node is the root of the tree.
"Inner": If the node is neither a leaf node nor a root node.

``` SAS
PROC SQL;
SELECT id, CASE 
WHEN Tree.id = (SELECT t.id FROM Tree t WHERE t.p_id is NULL)
    THEN 'Root'
When Tree.id in (SELECT t.p_id FROM Tree t)    
    THEN 'Inner'
ELSE 'Leaf'
END AS type
FROM Tree
ORDER BY id;
QUIT;
```

### Example:
<img width="323" alt="스크린샷 2022-10-16 오전 7 41 09" src="https://user-images.githubusercontent.com/107760647/196010185-14313ef0-b1f9-4227-8de0-6e5a9063cb4b.png">


Reference:
https://leetcode.com/problems/tree-node/


(Note)
* WHEN ~~~ IN ~~  = can be used to select multiple values 
