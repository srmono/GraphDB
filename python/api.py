from flask import Flask,request,jsonify,redirect,render_template
from neo4j import GraphDatabase
import csv

username="neo4j"
pwd="mypass123$"
uri="neo4j://localhost:7687"

print(username,pwd,uri)
driver=GraphDatabase.driver(uri=uri,auth=(username,pwd))
session=driver.session()
api=Flask(__name__)
@api.route("/create/<string:name>&<int:id>",methods=["GET","POST"])
def create_node(name,id):
    q1="""
    create (n:Employee{NAME:$name,ID:$id})
    """
    map={"name":name,"id":id}
    try:
        session.run(q1,map)
        return (f"employee node is created with employe name={name} and id={id}")
    except Exception as e:
        return (str(e))

@api.route("/display",methods=["GET","POST"])
def display_node():
    q1="""
    match (n) return n.NAME as NAME ,n.ID as ID
    """
    results=session.run(q1)
    data=results.data()
    return(jsonify(data))


if __name__=="__main__":
    api.run(port=5050)