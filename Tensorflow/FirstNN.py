#!/usr/bin/env python
# coding: utf-8

# In[1]:


import tensorflow as tf
import numpy as np
import seaborn as sns
import pandas as pd
import math as m
import pydot
import matplotlib.pyplot as plt
from tensorflow.keras import layers
from tensorflow.keras.optimizers import Adam, SGD, Adamax, Adadelta, RMSprop
from tensorflow.keras.utils import plot_model
from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import Dense, Input, Activation


# In[2]:


datos_brutos = pd.read_csv('datos_tensor.csv')
datos_brutos.head()


# In[3]:


#sns.pairplot(datos_brutos,diag_kind="kde")


# In[4]:


datos_train = datos_brutos.sample(frac=0.8,random_state=0)
datos_test = datos_brutos.drop(datos_train.index)


# In[5]:


datos_train


# In[6]:


datos_test


# In[7]:


training_statistics = datos_train.describe()
training_statistics


# In[8]:


training_statistics.pop("datos_tensor2")
training_statistics = training_statistics.transpose()
training_statistics


# In[9]:


etiquetas_entreno = datos_train.pop("datos_tensor2")
etiquetas_prueba = datos_test.pop("datos_tensor2")


# In[10]:


etiquetas_prueba


# In[11]:


def normalize(x):
    return (x - training_statistics['mean'])/training_statistics['std']


# In[12]:


entrenamiento_normalized = normalize(datos_train)
entrenamiento_normalized


# In[13]:


X = np.array(entrenamiento_normalized)
X


# In[14]:


Y = np.array(etiquetas_entreno)
Y


# In[15]:


model = Sequential()
model.add(Dense(128,input_dim=1,activation='sigmoid'))
model.add(Dense(64,activation = 'sigmoid'))
model.add(Dense(32,activation = 'sigmoid'))
model.add(Dense(1,activation='linear'))
model.compile(loss='mean_squared_error',optimizer='RMSprop',metrics=['mean_squared_error'])


# In[16]:


plot_model(model,to_file='diagrama1.png',show_shapes=True)


# 

# In[17]:


model.fit(X,Y,epochs=1000,batch_size=64,validation_split=0.1)
weights = model.get_weights()


plot_model(model,to_file='diagrama1.png',show_shapes=True)

# In[ ]:

ejemplo_prueba=normalize(datos_test)
px=np.array(ejemplo_prueba)
px

py=np.array(etiquetas_prueba)
py



